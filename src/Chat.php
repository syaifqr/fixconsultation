<?php

namespace MyApp;

use Chats;
use Ratchet\MessageComponentInterface;
use Ratchet\ConnectionInterface;

require dirname(__DIR__) . "/db/Users.php";
require dirname(__DIR__) . "/db/Chats.php";

class Chat implements MessageComponentInterface
{
    protected $clients;

    public function __construct()
    {
        $this->clients = new \SplObjectStorage;
        echo "Chat Server Started!";
    }

    public function onOpen(ConnectionInterface $conn)
    {
        // Store the new connection to send messages to later
        $this->clients->attach($conn);

        echo "New connection! ({$conn->resourceId})\n";
    }

    public function onMessage(ConnectionInterface $from, $msg)
    {
        $numRecv = count($this->clients) - 1;
        echo sprintf(
            'Connection %d sending message "%s" to %d other connection%s' . "\n",
            $from->resourceId,
            $msg,
            $numRecv,
            $numRecv == 1 ? '' : 's'
        );

        $data = json_decode($msg, true);
        date_default_timezone_set('Asia/Jakarta');

        // Create object for class chats
        $objChat =  new \Chats;
        $objChat->setUserId($data['user_id']);
        $objChat->setMessage($data['msg']);
        $objChat->setGroupId($data['group_id']);
        $objChat->setCreatedAt(date("Y-m-d h:i:s"));

        if ($objChat->saveChat()) {
            //Mengambil api untuk keperluan mendapatkan data user yang sedang terlibat dalam chat berdasarkan id
            include_once "../api/get_request.php";
            $dataUser = (json_decode(http_request_with_auth("https://account.lumintulogic.com/api/users.php", $_COOKIE['X-LUMINTU-REFRESHTOKEN']))->{'user'});

            for ($i = 0; $i < count($dataUser); $i++) {
                if ($dataUser[$i]->user_id == $data["user_id"]) {
                    $userData = $dataUser[$i];
                    $userName = $userData->user_username;
                }
            }
            $dataname = $userName;
            // $userName = 'testing';
            $data['msg'] = $data['msg'];
            $data['dt'] =  date("d-m-Y h:i:s");
        }

        foreach ($this->clients as $client) {
            // if ($from !== $client) {
            //     // The sender is not the receiver, send to each client connected
            //     $client->send(json_encode($data));
            // }

            if ($from == $client) {
                $data['from'] = "Me";
            } else {
                $data['from'] = $dataname;
            }
            $client->send(json_encode($data));
        }
    }

    public function onClose(ConnectionInterface $conn)
    {
        // The connection is closed, remove it, as we can no longer send it messages
        $this->clients->detach($conn);

        echo "Connection {$conn->resourceId} has disconnected\n";
    }

    public function onError(ConnectionInterface $conn, \Exception $e)
    {
        echo "An error has occurred: {$e->getMessage()}\n";

        $conn->close();
    }
}