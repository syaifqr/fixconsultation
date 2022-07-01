<?php

require("db/Users.php");
require("db/Chats.php");

session_start();

$user = $_SESSION['user_data']->user;

if (!isset($_SESSION['user_data'])) {
    header("location: login.php");
}



$loginPath = "login.php";
if (!isset($_COOKIE['X-LUMINTU-REFRESHTOKEN'])) {
    unset($_SESSION['user_data']);
    header("location: " . $loginPath);
}
if (!isset($_SESSION['user_data'])) {
    header("location: " . $loginPath);
}

$user = $_SESSION['user_data']->user;



if (isset($_POST['endChat'])) {
    // echo $_POST['idEnd'];
    require("db/Ports.php");

    $objPort = new Ports;

    if ($objPort->deletePortStatus($_POST['idEnd'])) {
        require("db/PrivillageGroup.php");

        $objPriv = new Privillage;

        $objPriv->deletePrivillage($_POST['idEnd']);

        return header('Location: /fixconsultation/frontend/pages/mentor_approve.php');
    }
}


// $response = json_decode(file_get_contents('https://i0ifhnk0.directus.app/items/user?filter={"user_email":"' . $email . '"}'), true);

echo "<input type='hidden' name='userId' id='userId' value='" . $user->user_id . "'>";


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grup chat</title>

    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">

    <!-- Tailwindcss -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/index.min.css" />

    <!-- daisyUI - Countdown -->
    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.14.3/dist/full.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>



    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"> -->
    <script src="https://kit.fontawesome.com/0c74db80aa.js" crossorigin="anonymous"></script>
    <script>
    tailwind.config = {
        theme: {
            extend: {
                fontFamily: {
                    montserrat: ["Montserrat"],
                },
                colors: {
                    "dark-green": "#1E3F41",
                    "light-green": "#659093",
                    "cream": "#DDB07F",
                    "cgray": "#F5F5F5",
                }
            }
        }
    }
    </script>
    <style>
    .sidebar #username_logo {
        display: none;
    }

    #profil_image {
        display: none !important;
    }

    .responsive-top {
        display: none;
    }

    .active {
        color: #DDB07F !important;
        border-bottom: solid 4px #DDB07F;
    }

    .in-active {
        width: 80px !important;
        padding: 20px 15px !important;
        transition: .5s ease-in-out;
    }

    .in-active ul li p {
        display: none !important;
    }

    .in-active ul li a {
        padding: 15px !important;
    }

    .in-active h2,
    .in-active h4,
    .in-active .logo-smk {
        display: none !important;
    }

    .hidden {
        display: none !important;
    }

    .sidebar {
        transition: .5s ease-in-out;
    }

    @media screen and (max-width: 414px) {
        .responsive-top {
            display: block;
        }

        #profil_image {
            display: flex !important;
        }

        .logo-smk {
            display: none !important;
        }

        .assignment-table th,
        .assignment-table td {
            font-size: 9px;
        }

        .assignment-table img {
            width: 45%;
        }

        .sidebar h2,
        .sidebar h4,
        .sidebar .logo-incareer,
        .sidebar hr,
        .sidebar #btnToggle {
            display: none !important;
        }

        .sidebar #username_logo {
            display: block;
            margin: 0;
        }

        .breadcrumb ul {
            font-size: .5rem;
        }

        .topic-title p {
            font-size: 1.35rem;
        }

        .mentor-profile img {
            width: 20%;
        }

        .mentor-profile p {
            font-size: .5rem;
        }

        .direction p {
            font-size: .5rem;
        }

        .tab-menu ul {
            font-size: .6rem;
        }

        .in-active {
            width: 80px !important;
            padding: 10px 15px !important;
            transition: .5s ease-in-out;
        }


        .sidebar {
            position: absolute;
            z-index: 1;
        }

        .rightbar {
            margin-left: 80px;
        }


    }
    </style>

</head>

<body class="overflow-hidden">
    <div class="responsive-top p-5">
        <div class="container flex flex-column justify-between mt-4 mb-4">
            <img class="w-[150px] logo-smk1" src="frontend/src/logo_lumintu.png" alt="Logo SMK">
            <img src="Img/icons/toggle_icons.svg" alt="toggle_dashboard" class="w-8 cursor-pointer" id="btnToggle2">
        </div>
    </div>
    <div class="flex items-center">
        <!-- Left side (Sidebar) -->
        <?php
        include 'sidebarChat.php';
        ?>


        <!-- Right side -->
        <div class="bg-[#F7F2F0] w-full h-screen px-10 py-6 flex flex-col gap-y-6 overflow-y-scroll rightbar">
            <!-- Header / Profile -->
            <div class="flex items-center gap-x-4 justify-end">
                <img class="w-10" src="Img/icons/default_profile.svg" alt="Profile Image">
                <p class="text-dark-green font-semibold"><?= $user->user_username ?></p>
            </div>

            <div>
                <p class="text-3xl text-dark-green font-semibold">Project Management - System Analyst</p>
            </div>


            <div class="relative mb-7">
                <!-- Countdown -->
                <!-- <div class="absolute text-white right-[113px] bg-slate-500 py-2 px-4 rounded-2xl">
                    <i class="mr-1 fas fa-clock"></i>
                    <span class="countdown font-mono text-sm">
                        <span style="--value:10;"></span>:
                        <span style="--value:24;"></span>:
                        <span style="--value:59;"></span>
                    </span>
                </div> -->
                <!-- End Session -->
                <?php
                if ($user->role_id == 3) {
                    echo '<a href="./frontend/pages/daftarRequest.php">
                    <div class="absolute right-[0px]">
                        <button
                            class="py-2 pb-3 px-7 text-sm font-medium first-line:text-center text-white bg-blue-700 rounded-2xl hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-200"
                            type="button">
                            Kembali
                        </button>
                </a>';
                } else {
                    echo '<a href="./frontend/pages/mentor_approve.php">
                    <div class="absolute right-[115px]">
                        <button
                            class="py-2 pb-3 px-7 text-sm font-medium first-line:text-center text-white bg-blue-700 rounded-2xl hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-200"
                            type="button">
                            Kembali
                        </button>
                </a>';
                }

                ?>

            </div>
            <?php

            if ($user->role_id == 2) {
                echo '<div class="absolute right-[0px]">
                    <button class="py-2 pb-3 px-4 text-sm font-medium first-line:text-center text-white bg-yellow-600 rounded-2xl hover:bg-red-700 focus:ring-4 focus:outline-none focus:ring-red-200" type="button" data-modal-toggle="deleteSes">
                        End Session
                    </button>
                    </div>';
            } else {
            }

            ?>



            <div id="deleteSes" tabindex="-1"
                class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 md:inset-0 h-modal md:h-full">
                <div class="relative p-4 w-full max-w-md h-full md:h-auto">
                    <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                        <a href="frontend/pages/mentor_approve.php"><button type="button"
                                class="absolute top-3 right-2.5 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
                                data-modal-toggle="deleteSes">
                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                        clip-rule="evenodd"></path>
                                </svg>
                            </button></a>
                        <div class="p-6 text-center">
                            <svg class="mx-auto mb-4 w-14 h-14 text-gray-400 dark:text-gray-200" fill="none"
                                stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                            <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Are you sure you
                                want to end this Session?</h3>

                            <form action="" method="post">
                                <input type="text" name="idEnd" id="idEnd" value="" hidden>
                                <button data-modal-toggle="deleteSes" type="submit" name="endChat"
                                    class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 dark:focus:ring-red-800 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                                    Yes, I'm sure
                                </button>
                            </form>

                            <button data-modal-toggle="deleteSes" type="button"
                                class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-gray-200 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">No,
                                cancel</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="absolute right-[0px]">
                    <form action="" method="post">
                        <input type="text" name="idEnd" id="idEnd" value="" hidden>
                        <button type="submit" name="endChat" class="py-2 pb-3 px-4 text-sm font-medium first-line:text-center text-white bg-yellow-600 rounded-2xl hover:bg-red-700 focus:ring-4 focus:outline-none focus:ring-red-200">
                            <p class="translate-y-0.5">End Session</p>
                        </button>
                    </form>
                </div> -->
        </div>

        <div class="flex">
            <!-- Search Chat -->
            <div class="w-1/3 mr-6 mt-10 rounded-xl">
                <!-- <form>
                        <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-gray-300">Search</label>
                        <div class="relative">
                            <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                                </svg>
                            </div>
                            <input type="search" id="default-search" class="block p-3 pl-10 w-full text-sm text-gray-900  rounded-xl border border-gray-300 focus:ring-[#ddb07f] focus:border-[#ddb07f]" name="search" placeholder="Search Message" required>
                        </div>
                    </form> -->
            </div>
            <!-- User Konsultasi -->
            <div class="w-2/3 border rounded-lg border-gray-300 bg-white">
                <div>
                    <div class="flex gap-x-4 py-3 px-7">
                        <!-- <img class="w-14" src="Img/icons/default_profile.svg" alt="Profile Image"> -->
                        <div class="">
                            <p class="flex py-4 text-dark-green text-base font-bold" id="title-cons">Bimbingan
                            </p>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="flex">
            <!-- List Chat -->
            <div class="w-1/3 mr-6">
                <div>
                    <div class="border border-gray-300 rounded-xl bg-white">
                        <ul class="overflow-auto h-[44rem]">
                            <li>


                                <?php
                                require "./db/Groups.php";
                                $objGroup = new Groups;
                                //Mencari grup sesuai filter grup yang sudah dibuat
                                $groups = $objGroup->filterGroup($user->user_id);


                                if (count($groups) > 0) {
                                    foreach ($groups as $key => $group) {

                                ?>

                                <?php

                                        $idgrup = $group['group_id'];

                                        ?>

                                <!-- Mendapatkan grup id yang diklik -->
                                <a onclick="requestChat(<?= $group['group_id'] ?> , '<?= $user->user_email ?>', '<?= $group['group_name'] ?>' )"
                                    class="flex items-center px-3 py-2 text-sm transition duration-150 ease-in-out border-b border-gray-300 cursor-pointer hover:bg-gray-100 focus:outline-none rounded-t-xl">
                                    <img class="object-cover w-11 h-12 rounded-full" src="Img/icons/default_profile.svg"
                                        alt="Profile Image">
                                    <div class="w-full pb-2">
                                        <div class="flex justify-between">
                                            <span
                                                class="block ml-2 font-bold text-[#1e3f41]"><?= $group['group_name'] ?></span>
                                            <!-- <span class="block ml-2 text-sm text-gray-600">25 minutes</span> -->
                                        </div>
                                        <!-- <span class="block ml-2 text-sm text-gray-600">Lorem Ipsum Dolor sit...</span> -->
                                    </div>
                                </a>

                                <?php
                                    }
                                } else {

                                    echo '<p style="padding: 20px" >Sedang tidak dalam bimbingan</p>';
                                } ?>


                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Room Chat -->
            <div class="w-2/3">
                <div>
                    <div class="border border-gray-300 rounded-xl bg-white">
                        <div class="w-full">
                            <div class="relative w-full p-6 overflow-y-auto h-[40rem]">
                                <!-- tanggal -->
                                <div class="w-1/6 mx-auto">

                                </div>
                                <ul class="space-y-2" id="chat-container">

                                </ul>
                            </div>


                            <!-- TYPING CHAT -->
                            <form action="" method="POST"
                                class="flex items-center justify-between w-full p-3 border-t border-gray-300">
                                <!-- EMOTICON -->
                                <button type="button">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                        class="second-btn -6 h-6 text-gray-500 hover:text-gray-600 active:text-gray-700 focus:ring focus:bg-gray-300"
                                        fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                    </svg>
                                </button>
                                <!-- UPLOAD FILE -->
                                <!-- <button>
                                            <label>
                                                <i class="fa-solid fa-paperclip fa-lg text-gray-500 ml-1 cursor-pointer hover:text-gray-600 active:text-gray-700 focus:ring focus:bg-gray-300"></i>
                                                <input type="file" name="myfile" style="display:none">
                                            </label>
                                        </button> -->
                                <input type="text" placeholder="Enter Message" name="message" id="message"
                                    class="two block w-full py-2 pl-4 mx-3 bg-gray-100 rounded-full outline-none focus:outline-none focus:text-gray-700 focus:ring-1 focus:ring-[#ddb07f] focus:border-[#ddb07f]" />
                                <!-- SEND CHAT -->
                                <button type="submit" name="send" id="send">
                                    <svg class="w-5 h-5 text-gray-500 origin-center transform rotate-90 hover:text-gray-600 active:text-gray-700 focus:ring focus:bg-gray-300"
                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                        <path
                                            d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z" />
                                    </svg>
                                </button>
                            </form>


                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    </div>

    <script>
    function requestChat(id, email, groupName) {

        $('#title-cons').html(groupName);

        $('#idEnd').attr('value', id);
        // mengkosongkan halaman chat box
        $('#chat-container').html("");
        console.log(groupName);
        $('#tittleGroup').html(groupName);

        console.log(email);

        $.ajax({
            method: "POST",
            data: {
                group_id: id,
                user_email: email
            },
            url: "action.php",
            success: function(data, status) {

                let isi = JSON.parse(data)

                console.log(isi);

                // ambil data pesan
                let message = isi.message;
                console.log(message);

                // melakukan looping data pesan yang sesuai dengan id grup
                for (let e in message) {
                    console.log(e + " -> " + message[e]);

                    // console.log(z + "->" + message[e][z]['chat_id']);
                    let val = message[e];


                    // menambahkan chat yang telah difilter ke dalam halaman     
                    let styleBox = '';

                    if (val['user_id'] == isi.userId) {
                        styleBox = 'bg-red-200 text-right ml-auto';
                        styleBox2 = 'mr-auto text-right';
                        val['username'] = "Me";
                    } else {
                        styleBox = 'bg-green-200 text-left mr-auto';
                        styleBox2 = 'ml-auto text-left';
                    }
                    //Tampilan chat setelah direfresh
                    let contain = '<div class="max-w-fit ' + styleBox +
                        ' rounded-xl px-4 py-2 ..."><small class="font-bold ">' + val[
                            'username'] +
                        '</small><p class="">' + val['message'] +
                        '</p><p class="text-right text-xs text-gray-400 ">' + val['created_at'] +
                        '</p></div>';

                    // memasukan ke halaman chatroom 
                    $('#chat-container').append(contain);


                }

                requestNewWSConnection(isi.portData);
                var conn = new WebSocket("ws://localhost:" + isi.portData);


                console.log(conn)
                conn.onopen = function(e) {
                    console.log("Connection Establish...");
                }

                conn.onmessage = function(e) {
                    // console.log(e.data);
                    data = JSON.parse(e.data);
                    console.log(e.data);

                    var styleBox = '';
                    var styleBox2 = '';

                    if (data.from == "Me") {
                        styleBox =
                            'relative max-w-fit px-4 py-2 text-gray-700 rounded-xl shadow bg-red-200';
                        styleBox2 = 'justify-end';
                        styleBox3 = 'text-right';
                        styleBox4 = ' ml-[150px]';
                    } else {
                        styleBox =
                            'relative max-w-fit px-4 py-2 text-gray-700 bg-green-200 rounded-xl shadow';
                        styleBox2 = 'justify-start';
                        styleBox3 = 'text-left';
                        styleBox4 = ' mr-[150px]';
                    }

                    if (data.group_id == id) {
                        //Tampilan chat secara realtime
                        var box = `<li class="flex ` + styleBox2 + `">
                                            <div class="` + styleBox + ` ` + styleBox4 + `">
                                                <p class="text-[#1e3f41] font-bold ` + styleBox3 + ` ">` + data.from + `</p>
                                                <span class="block text-justify ` + styleBox3 + `">` + data.msg + `</span>
                                                <span class="text-gray-500 text-xs flex justify-end">` + data.dt + `</span></p>
                                            </div>
                                    </li>`;

                        $("#chat-container").append(box);
                    }

                }

                $("#send").click(function(e) {
                    e.preventDefault();

                    let message = $('#message').val();

                    let uid = $('#userId').val();

                    let chatData = {
                        user_id: uid,
                        msg: message,
                        group_id: id,
                    };
                    // console.log(chatData)

                    conn.send(JSON.stringify(chatData));
                    // console.log(chatData);

                    document.getElementById("message").value = "";
                })
            }
        })
    }

    function requestNewWSConnection(data) {
        $.post("./bin/chat-server.php", {
            data: data
        }, function(data, status) {
            console.log(data);
        })
    }
    </script>



    <script src="vanillaEmojiPicker.js"></script>
    <script>
    new EmojiPicker({
        trigger: [{
            selector: ".second-btn",
            insertInto: ".two",
        }, ],
        closeButton: true,
        //specialButtons: green
    });
    </script>

    <script src="https://unpkg.com/flowbite@1.4.2/dist/flowbite.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.2/dist/flowbite.min.css" />

    <script src="https://cdn.jsdelivr.net/npm/tw-elements/dist/js/index.min.js"></script>
    <script>
    let btnToggle = document.getElementById('btnToggle');
    let sidebar = document.querySelector('.sidebar');
    btnToggle.onclick = function() {
        sidebar.classList.toggle('in-active');
    }
    btnToggle2.onclick = function() {
        sidebar.classList.toggle('in-active');
    }
    </script>

</body>

</html>