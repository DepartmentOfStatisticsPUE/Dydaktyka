#### download data

download.file(url = 'https://bkl.parp.gov.pl/pobierz.html/BKL_lud%201-5.7z',
              destfile = 'Badania Internetowe/data-raw/bkl.7z')

### unfortunately it is stored in 7z file so it is required to have 7zip on your machine
system('7z e "Badania Internetowe/data-raw/bkl.7z"')

### move file to correct directory
file.rename(from = 'BKL_lud 1-5.sav',
            to = 'Badania Internetowe/data-raw/BKL_lud 1-5.sav')

### read file
bkl <- read_spss('Badania Internetowe/data-raw/BKL_lud 1-5.sav')
write.fst(x = as.data.frame(bkl), 
          path = 'Badania Internetowe/data-raw/bkl-study.fst', 
          compress = 100)

### remove files that are not needed
file.remove('Badania Internetowe/data-raw/BKL_lud 1-5.sav',
            'Badania Internetowe/data-raw/bkl.7z')

bkl <- read.fst('Badania Internetowe/data-raw/bkl-study.fst')


