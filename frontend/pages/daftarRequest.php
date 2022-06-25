<?php
session_start();

require '../../db/Acceptance.php';
require "../../api/get_request.php";

$loginPath = "../../login.php";
if (!isset($_SESSION['user_data'])) {
    header('location:' . $loginPath);
}

$user = $_SESSION['user_data']->user;

switch ($_SESSION['user_data']->{'user'}->{'role_id'}) {
        // KONDISI KETIKA USER MEMASUKI HALAMAN NAMUN LOGIN SEBAGAI ADMIN
    case 1:
        echo "
        <script>

            location.replace('admin.php');
        </script>
        ";
        break;
        // KONDISI KETIKA USER MEMASUKI HALAMAN NAMUN LOGIN SEBAGAI STUDENT
    case 2:
        echo "
        <script>
            location.replace('mentor.php');
        </script>
        ";
        break;
    default:
        break;
}

// acceptance
$objAccept = new Acceptance;
$acception = $objAccept->getDataByIdStudent($_SESSION['user_data']->user->user_id);
// var_dump($acception);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Daftar Request</title>
    <link href="Img/icons/logo_lumintu1.ico" rel='icon' />

    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">

    <!-- Tailwindcss -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.2/dist/flowbite.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tw-elements/dist/css/index.min.css" />

    <!-- Intro.JS -->
    <link rel="stylesheet" href="https://unpkg.com/intro.js/minified/introjs.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/intro.js/themes/introjs-modern.css" />

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

<body>
    <div class="responsive-top p-5">
        <div class="container flex flex-column justify-between mt-4 mb-4">
            <img class="w-[150px] logo-smk1" src="../src/logo_lumintu.png" alt="Logo SMK">
            <img src="Img/icons/toggle_icons.svg" alt="toggle_dashboard" class="w-8 cursor-pointer" id="btnToggle2">
        </div>
    </div>
    <div class="flex items-center">
        <!-- Left side (Sidebar) -->
        <?php
        include 'partial/student/_sidebar.php';
        ?>


        <!-- Right side -->
        <div class="bg-cgray w-full h-screen px-10 py-6 flex flex-col gap-y-6 overflow-y-scroll rightbar">
            <!-- Header / Profile -->
            <div class="flex items-center gap-x-4 justify-end">
                <img class="w-10" src="./Img/icons/default_profile.svg" alt="Profile Image">
                <p class="text-dark-green font-semibold"><?= $user->user_username ?></p>
            </div>

            <!-- Breadcrumb -->
            <div>
                <ul class="flex items-center gap-x-4">
                    <li>
                        <a class="text-light-green" href="#">Beranda</a>
                    </li>
                    <li>
                        <span class="text-light-green">/</span>
                    </li>
                    <li>
                        <a class="text-light-green" href="#">Konsultasi</a>
                    </li>
                    <li>
                        <span class="text-light-green">/</span>
                    </li>
                    <li>
                        <a class="text-light-green font-semibold" href="#">Status Konsultasi</a>
                    </li>
                </ul>
            </div>
            <?php
            include 'partial/student/_navbar.php';
            ?>

            <div>
                <p class="text-3xl text-dark-green font-semibold">Detail Permohonan</p>
            </div>

            <div class="table-status">
                <table class="shadow-lg bg-white rounded-xl" style="width: 100%">
                    <colgroup>
                        <col span="1" style="width: 10%">
                        <col span="1" style="width: 10%">
                        <col span="1" style="width: 10%">
                        <col span="1" style="width: 10%">
                        <col span="1" style="width: 10%">
                        <col span="1" style="width: 5%">
                    </colgroup>
                    <thead>
                        <tr class="text-dark-green">
                            <th class="border-b text-left px-4 py-2">Nama Mentor</th>
                            <th class="border-b text-center px-4 py-2">Topik</th>
                            <th class="border-b text-center px-4 py-2">Tanggal</th>
                            <th class="border-b text-center px-4 py-2">Jam</th>
                            <th class="border-b text-center px-4 py-2">Status</th>
                            <th class="border-b text-center px-4 py-2">Aksi</th>
                    </thead>
                    <tbody>

                        <?php foreach ($acception as $key) : ?>
                            <tr>
                                <?php
                                $topik = ($key['topic']);
                                $time = explode(' ', $key['time']);

                                $date = $time[0];

                                $clock = $time[1];

                                ?>

                                <?php

                                $token = $_COOKIE['X-LUMINTU-REFRESHTOKEN'];
                                $users = (json_decode(http_request_with_auth("https://account.lumintulogic.com/api/user-data.php", $token))->{'data'});


                                for ($i = 0; $i < count($users); $i++) {
                                    if ($users[$i]->user_id == $key['user_id']) {
                                        $name = $users[$i]->user_username;
                                        break;
                                    }
                                }

                                ?>

                                <td class="border-b px-4 py-2"><?= $name ?></td>
                                <td class="border-b px-4 py-2 text-center"><?= $topik ?></td>
                                <td class="border-b px-4 py-2 text-center"><?= $date ?></td>
                                <td class="border-b px-4 py-2 text-center"><?= $clock ?></td>
                                <td class="border-b px-4 py-2 text-center">
                                    <?php if ($key['status'] == 'reject') { ?>
                                        <div class="text-white bg-gradient-to-r from-red-400 via-red-500 to-red-600 rounded-lg text-sm flex text-center py-2 px-4 w-3/4 mx-auto">
                                            <div class="ml-5 text-red-500 bg-red-100  dark:bg-red-800 dark:text-red-200 rounded-lg">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z">
                                                    </path>
                                                </svg>
                                            </div>
                                            <div class="ml-6 text-sm font-medium text-white">
                                                Tolak
                                            </div>
                                        </div>
                                    <?php } else if ($key['status'] == 'active') { ?>
                                        <div class="text-white bg-gradient-to-r from-green-400 via-green-500 to-green-600 rounded-lg text-sm flex text-center py-2 px-4 w-3/4 mx-auto">
                                            <div class="ml-5 text-green-500 bg-green-100 rounded-lg">
                                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z">
                                                    </path>
                                                </svg>
                                            </div>
                                            <div class="ml-6 text-sm font-medium text-white">Diterima
                                            </div>
                                        </div>
                                    <?php } else { ?>
                                        <!-- <div class="border border-yellow-500 rounded-lg text-sm flex text-center py-2 px-3 w-3/4 mx-auto">
                                            <div class=" text-red-500 bg-red-100  dark:bg-red-800 dark:text-red-200 rounded-lg">
                                            </div>
                                            <div class="text-sm font-medium">
                                                Menunggu Konfirmasi
                                            </div>
                                        </div> -->
                                        <div class="text-sm font-medium">
                                            Menunggu Konfirmasi...
                                        </div>
                                    <?php } ?>

                                </td>
                                <td class="border-b px-4 py-2 text-center">
                                    <?php if ($key['status'] == 'active') { ?>
                                        <a href="./../../group_chat.php"><button type="button" class=" button-konsultasi px-4 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Konsultasi</button></a>
                                    <?php } else { ?>
                                        <p>-</p>
                                    <?php } ?>
                                </td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
    </div>

    <script src="https://unpkg.com/intro.js/minified/intro.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

    <script>
        const intro = introJs();

        intro.setOptions({
            steps: [{
                    title: 'Selamat Datang',
                    intro: 'Hallo Codetion👋'
                },
                {
                    title: 'Status',
                    element: document.querySelector('.table-status'),
                    intro: 'Cek status bimbingan mu disini </br> </br> Jika disetujui, anda bisa langsung melakukan konsultasi dengan mentor.'
                },
                {
                    title: 'Tombol Konsultasi',
                    element: document.querySelector('.button-konsultasi'),
                    intro: 'Anda bisa memulai konsultasi dengan menekan tombol konsultasi ini.'
                },
                {
                    title: 'Bantuan',
                    element: document.querySelector('.help'),
                    intro: 'Jika anda masih bingung, tombol ini bisa membantu anda untuk <b>mengulangi tutorial<b>.'
                }

            ],
            showProgress: true,
            showBullets: false,
            disableInteraction: true,
            showStepNumbers: true
        })


        var name = 'IntroJS';
        var value = localStorage.getItem(name) || $.cookie(name);
        var func = function() {
            if (Modernizr.localstorage) {
                localStorage.setItem(name, 1)
            } else {
                $.cookie(name, 1, {
                    expires: 365
                });
            }
        };
        if (value == null) {
            intro.start().oncomplete(func).onexit(func);
        };
    </script>

    <!-- Intro.JS Student -->
    <script>
        function tutorial() {
            introJs().setOptions({
                steps: [{
                        title: 'Selamat Datang',
                        intro: 'Hallo Codetion👋 <br/> Anda butuh bantuan? Yuks aku kasih tauu!'
                    },
                    {
                        title: 'Status',
                        element: document.querySelector('.table-status'),
                        intro: 'Cek status bimbingan mu disini </br> </br> Jika disetujui, anda bisa langsung melakukan konsultasi dengan mentor.'

                    },
                    {
                        title: 'Tombol Konsultasi',
                        element: document.querySelector('.button-konsultasi'),
                        intro: 'Anda bisa memulai konsultasi dengan menekan tombol konsultasi ini.'
                    }

                ],
                showProgress: true,
                showBullets: false,
                disableInteraction: true,
                showStepNumbers: true
            }).start()
        };
    </script>

    <script src="https://unpkg.com/flowbite@1.4.2/dist/flowbite.js"></script>
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