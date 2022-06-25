<div class="bg-white w-full h-[50px] flex content-center px-10  rounded-xl">
                <?php $classActive =  'text-dark-green text-cream border-b-4 border-cream h-[50px] flex items-center font-semibold  cursor-pointer'; ?>
                <?php $classDiss =  'text-dark-green hover:text-cream hover:border-b-4 hover:border-cream h-[50px] flex items-center font-semibold  cursor-pointer'; ?>
                <ul class="flex items-center gap-x-8">
                    <li class="status <?= $_SERVER['REQUEST_URI'] == '/consutationFIX/frontend/pages/mentor_approve.php' ?  $classActive : $classDiss?>">
                        <a href="mentor_approve.php"><p>Status Konsultasi </p></a>
                    </li>
                    <a href="mentor.php"><li class="permohonan <?= $_SERVER['REQUEST_URI'] == '/consutationFIX/frontend/pages/mentor.php' ? $classActive : $classDiss?>">
                         Permohonan Konsultasi 
                    </li></a>   
                    <a href="mentor_set_schedule.php"><li class="jadwal <?= $_SERVER['REQUEST_URI'] == '/consutationFIX/frontend/pages/mentor_set_schedule.php' ?  $classActive : $classDiss?>">
                        <p>Jadwal Konsultasi</p>
                    </li></a>
                </ul>
            </div>

            