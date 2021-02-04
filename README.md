#Baza pracownikow - Piotr Rawski

####Aplikacja do prowadzenia bazy pracownikow. Pozwala na dodawanie nowego pracownika, wyswietlenie wszystkich zatrudnionych pracownikow, edycje danych pracownika oraz usuniecie go z bazy.

####Aplikacja stworzona w Nodejs z wykorzystaniem expressjs korzystajaca z CosmoDB.

####Aplikacja korzysta z uslugi Azure AppService oraz bazy danych CosmoDB.


* zaloguj sie do azure portal
* az login
* uruchom skrypt: script-app-service.sh
* uruchom skrypt: script-cosmodb.sh

* Wejdz na strone https://portal.azure.com/ 
* Grupa zasobow -> MyResourceGroup -> cosmodb*
* Z menu po lewej stronie wybrac Szybki start -> zakladka z NodeJs 
* Skopiowac tekst z pola "PODSTAWOWE PARAMETRY POŁĄCZENIA"
* Cofnac sie do MyResourceGroup -> Otworzyc AppService o nazwie mywebapp* 
* Z menu po lewej stronie wybraac "Konfiguracja" -> Utworzyc zmienna srodowiskowa poprzez wybranie "Nowe ustawienie aplikacji"  
* W polu "Nazwa" wpisac DB_CONNECT
* W pole "Wartosc" wkleic skopiowany wczesniej tekst -> OK -> Zapisz

* uruchom skrypt: scripr-functions.sh

* Otworz strone z aplikacja

                                   
                                    
