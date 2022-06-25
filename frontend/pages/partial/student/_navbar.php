<div class="bg-white w-full h-[50px] flex content-center px-10  rounded-xl">
                <?php $classActive = 'text-dark-green text-cream border-b-4 border-cream h-[50px] flex items-center font-semibold  cursor-pointer';
                    $classDiss = 'text-dark-green hover:text-cream hover:border-b-4 hover:border-cream h-[50px] flex items-center font-semibold  cursor-pointer' ?>
                <ul class="flex items-center gap-x-8">
                    <li class="<?= $_SERVER['REQUEST_URI'] == '/consutationFIX/frontend/pages/daftarRequest.php' ? $classActive : $classDiss; ?>">
                        <a href="daftarRequest.php" class="status"><p>Status Konsultasi</p></a>
                    </li>
                    <a href="index.php"><li class="booking <?= $_SERVER['REQUEST_URI'] == '/consutationFIX/frontend/pages/index.php' ? $classActive : $classDiss ?>">
                         Permohonan Konsultasi 
                    </li></a>
                </ul>
            </div>

            