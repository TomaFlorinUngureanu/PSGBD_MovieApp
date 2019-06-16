DROP TABLE FILME CASCADE CONSTRAINTS
/
DROP TABLE EMAILS CASCADE CONSTRAINTS
/
DROP TABLE GENURI CASCADE CONSTRAINTS
/
DROP TABLE UTILIZATORI CASCADE CONSTRAINTS
/
DROP TABLE NOTEE CASCADE CONSTRAINTS
/
CREATE TABLE FILME (
    ID NUMBER(38,0) NOT NULL PRIMARY KEY,
    BUGET NUMBER(38,0),
    PAGINA VARCHAR2(138 BYTE),
    DATA_LANSARE DATE,
    PROFIT NUMBER(38,0),
    DURATA NUMBER(38,0),
    LIMBA VARCHAR2(474 BYTE),
    TITLU VARCHAR2(86 BYTE) NOT NULL,
    GEN VARCHAR2(230 BYTE)
)
/
CREATE TABLE GENURI (
    ID NUMBER(38,0) NOT NULL PRIMARY KEY,
    ID_FILM NUMBER(38,0) NOT NULL,
    GEN VARCHAR2(230 BYTE) NOT NULL
)
/
CREATE TABLE UTILIZATORI (
    ID NUMBER(38,0) NOT NULL PRIMARY KEY,
    NUME VARCHAR2(30) NOT NULL,
    PRENUME VARCHAR2(30) NOT NULL,
    PAROLA VARCHAR2(40) NOT NULL
)
/
CREATE TABLE EMAILS (
    ID NUMBER(38,0) NOT NULL PRIMARY KEY,
    EMAIL VARCHAR2(50) NOT NULL UNIQUE
)
/
CREATE TABLE NOTEE (
    ID NUMBER(38,0) NOT NULL PRIMARY KEY,
    ID_UTILIZATOR NUMBER(38,0) NOT NULL,
    ID_FILM NUMBER(38,0) NOT NULL,
    VALOARE INT
)
/
SET SERVEROUTPUT ON;
DECLARE
    v_temp_filme int :=1;
    v_temp_gen int :=1;
    v_temp_note int :=1;
    v_aux int;
    v_aux2 int;
    v_aux3 int;
    v_nume VARCHAR2(255);
    v_prenume VARCHAR2(255);
    v_email VARCHAR2(50);
    v_parola VARCHAR2(40);
    TYPE varr IS VARRAY(1000) OF varchar2(255);
    lista_nume varr := varr('Ababei','Acasandrei','Adascalitei','Afanasie','Agafitei','Agape','Aioanei','Alexandrescu','Alexandru','Alexe','Alexii','Amarghioalei','Ambroci','Andonesei','Andrei','Andrian','Andrici','Andronic','Andros','Anghelina','Anita','Antochi','Antonie','Apetrei','Apostol','Arhip','Arhire','Arteni','Arvinte','Asaftei','Asofiei','Aungurenci','Avadanei','Avram','Babei','Baciu','Baetu','Balan','Balica','Banu','Barbieru','Barzu','Bazgan','Bejan','Bejenaru','Belcescu','Belciuganu','Benchea','Bilan','Birsanu','Bivol','Bizu','Boca','Bodnar','Boistean','Borcan','Bordeianu','Botezatu','Bradea','Braescu','Budaca','Bulai','Bulbuc-aioanei','Burlacu','Burloiu','Bursuc','Butacu','Bute','Buza','Calancea','Calinescu','Capusneanu','Caraiman','Carbune','Carp','Catana','Catiru','Catonoiu','Cazacu','Cazamir','Cebere','Cehan','Cernescu','Chelaru','Chelmu','Chelmus','Chibici','Chicos','Chilaboc','Chile','Chiriac','Chirila','Chistol','Chitic','Chmilevski','Cimpoesu','Ciobanu','Ciobotaru','Ciocoiu','Ciofu','Ciornei','Citea','Ciucanu','Clatinici','Clim','Cobuz','Coca','Cojocariu','Cojocaru','Condurache','Corciu','Corduneanu','Corfu','Corneanu','Corodescu','Coseru','Cosnita','Costan','Covatariu','Cozma','Cozmiuc','Craciunas','Crainiceanu','Creanga','Cretu','Cristea','Crucerescu','Cumpata','Curca','Cusmuliuc','Damian','Damoc','Daneliuc','Daniel','Danila','Darie','Dascalescu','Dascalu','Diaconu','Dima','Dimache','Dinu','Dobos','Dochitei','Dochitoiu','Dodan','Dogaru','Domnaru','Dorneanu','Dragan','Dragoman','Dragomir','Dragomirescu','Duceac','Dudau','Durnea','Edu','Eduard','Eusebiu','Fedeles','Ferestraoaru','Filibiu','Filimon','Filip','Florescu','Folvaiter','Frumosu','Frunza','Galatanu','Gavrilita','Gavriliuc','Gavrilovici','Gherase','Gherca','Ghergu','Gherman','Ghibirdic','Giosanu','Gitlan','Giurgila','Glodeanu','Goldan','Gorgan','Grama','Grigore','Grigoriu','Grosu','Grozavu','Gurau','Haba','Harabula','Hardon','Harpa','Herdes','Herscovici','Hociung','Hodoreanu','Hostiuc','Huma','Hutanu','Huzum','Iacob','Iacobuta','Iancu','Ichim','Iftimesei','Ilie','Insuratelu','Ionesei','Ionesi','Ionita','Iordache','Iordache-tiroiu','Iordan','Iosub','Iovu','Irimia','Ivascu','Jecu','Jitariuc','Jitca','Joldescu','Juravle','Larion','Lates','Latu','Lazar','Leleu','Leon','Leonte','Leuciuc','Leustean','Luca','Lucaci','Lucasi','Luncasu','Lungeanu','Lungu','Lupascu','Lupu','Macariu','Macoveschi','Maftei','Maganu','Mangalagiu','Manolache','Manole','Marcu','Marinov','Martinas','Marton','Mataca','Matcovici','Matei','Maties','Matrana','Maxim','Mazareanu','Mazilu','Mazur','Melniciuc-puica','Micu','Mihaela','Mihai','Mihaila','Mihailescu','Mihalachi','Mihalcea','Mihociu','Milut','Minea','Minghel','Minuti','Miron','Mitan','Moisa','Moniry-abyaneh','Morarescu','Morosanu','Moscu','Motrescu','Motroi','Munteanu','Murarasu','Musca','Mutescu','Nastaca','Nechita','Neghina','Negrus','Negruser','Negrutu','Nemtoc','Netedu','Nica','Nicu','Oana','Olanuta','Olarasu','Olariu','Olaru','Onu','Opariuc','Oprea','Ostafe','Otrocol','Palihovici','Pantiru','Pantiruc','Paparuz','Pascaru','Patachi','Patras','Patriche','Perciun','Perju','Petcu','Pila','Pintilie','Piriu','Platon','Plugariu','Podaru','Poenariu','Pojar','Popa','Popescu','Popovici','Poputoaia','Postolache','Predoaia','Prisecaru','Procop','Prodan','Puiu','Purice','Rachieru','Razvan','Reut','Riscanu','Riza','Robu','Roman','Romanescu','Romaniuc','Rosca','Rusu','Samson','Sandu','Sandulache','Sava','Savescu','Schifirnet','Scortanu','Scurtu','Sfarghiu','Silitra','Simiganoschi','Simion','Simionescu','Simionesei','Simon','Sitaru','Sleghel','Sofian','Soficu','Sparhat','Spiridon','Stan','Stavarache','Stefan','Stefanita','Stingaciu','Stiufliuc','Stoian','Stoica','Stoleru','Stolniceanu','Stolnicu','Strainu','Strimtu','Suhani','Tabusca','Talif','Tanasa','Teclici','Teodorescu','Tesu','Tifrea','Timofte','Tincu','Tirpescu','Toader','Tofan','Toma','Toncu','Trifan','Tudosa','Tudose','Tuduri','Tuiu','Turcu','Ulinici','Unghianu','Ungureanu','Ursache','Ursachi','Urse','Ursu','Varlan','Varteniuc','Varvaroi','Vasilache','Vasiliu','Ventaniuc','Vicol','Vidru','Vinatoru','Vlad','Voaides','Vrabie','Vulpescu','Zamosteanu','Zazuleac');
    lista_prenume_fete varr := varr('Adina','Alexandra','Alina','Ana','Anca','Anda','Andra','Andreea','Andreia','Antonia','Bianca','Camelia','Claudia','Codrina','Cristina','Daniela','Daria','Delia','Denisa','Diana','Ecaterina','Elena','Eleonora','Elisa','Ema','Emanuela','Emma','Gabriela','Georgiana','Ileana','Ilona','Ioana','Iolanda','Irina','Iulia','Iuliana','Larisa','Laura','Loredana','Madalina','Malina','Manuela','Maria','Mihaela','Mirela','Monica','Oana','Paula','Petruta','Raluca','Sabina','Sanziana','Simina','Simona','Stefana','Stefania','Tamara','Teodora','Theodora','Vasilica','Xena');
    lista_prenume_baieti varr := varr('Adrian','Alex','Alexandru','Alin','Andreas','Andrei','Aurelian','Beniamin','Bogdan','Camil','Catalin','Cezar','Ciprian','Claudiu','Codrin','Constantin','Corneliu','Cosmin','Costel','Cristian','Damian','Dan','Daniel','Danut','Darius','Denise','Dimitrie','Dorian','Dorin','Dragos','Dumitru','Eduard','Elvis','Emil','Ervin','Eugen','Eusebiu','Fabian','Filip','Florian','Florin','Gabriel','George','Gheorghe','Giani','Giulio','Iaroslav','Ilie','Ioan','Ion','Ionel','Ionut','Iosif','Irinel','Iulian','Iustin','Laurentiu','Liviu','Lucian','Marian','Marius','Matei','Mihai','Mihail','Nicolae','Nicu','Nicusor','Octavian','Ovidiu','Paul','Petru','Petrut','Radu','Rares','Razvan','Richard','Robert','Roland','Rolland','Romanescu','Sabin','Samuel','Sebastian','Sergiu','Silviu','Stefan','Teodor','Teofil','Theodor','Tudor','Vadim','Valentin','Valeriu','Vasile','Victor','Vlad','Vladimir','Vladut');
    lista_last_name varr := varr('Abbott','Acevedo','Acosta','Adams','Adkins','Aguilar','Aguirre','Albert','Alexander','Alford','Allen','Allison','Alston','Alvarado','Alvarez','Anderson','Andrews','Anthony','Armstrong','Arnold','Ashley','Atkins','Atkinson','Austin','Avery','Avila','Ayala','Ayers','Bailey','Baird','Baker','Baldwin','Ball','Ballard','Banks','Barber','Barker','Barlow','Barnes','Barnett','Barr','Barrera','Barrett','Barron','Barry','Bartlett','Barton','Bass','Bates','Battle','Bauer','Baxter','Beach','Bean','Beard','Beasley','Beck','Becker','Bell','Bender','Benjamin','Bennett','Benson','Bentley','Benton','Berg','Berger','Bernard','Berry','Best','Bird','Bishop','Black','Blackburn','Blackwell','Blair','Blake','Blanchard','Blankenship','Blevins','Bolton','Bond','Bonner','Booker','Boone','Booth','Bowen','Bowers','Bowman','Boyd','Boyer','Boyle','Bradford','Bradley','Bradshaw','Brady','Branch','Bray','Brennan','Brewer','Bridges','Briggs','Bright','Britt','Brock','Brooks','Brown','Browning','Bruce','Bryan','Bryant','Buchanan','Buck','Buckley','Buckner','Bullock','Burch','Burgess','Burke','Burks','Burnett','Burns','Burris','Burt','Burton','Bush','Butler','Byers','Byrd','Cabrera','Cain','Calderon','Caldwell','Calhoun','Callahan','Camacho','Cameron','Campbell','Campos','Cannon','Cantrell','Cantu','Cardenas','Carey','Carlson','Carney','Carpenter','Carr','Carrillo','Carroll','Carson','Carter','Carver','Case','Casey','Cash','Castaneda','Castillo','Castro','Cervantes','Chambers','Chan','Chandler','Chaney','Chang','Chapman','Charles','Chase','Chavez','Chen','Cherry','Christensen','Christian','Church','Clark','Clarke','Clay','Clayton','Clements','Clemons','Cleveland','Cline','Cobb','Cochran','Coffey','Cohen','Cole','Coleman','Collier','Collins','Colon','Combs','Compton','Conley','Conner','Conrad','Contreras','Conway','Cook','Cooke','Cooley','Cooper','Copeland','Cortez','Cote','Cotton','Cox','Craft','Craig','Crane','Crawford','Crosby','Cross','Cruz','Cummings','Cunningham','Curry','Curtis','Dale','Dalton','Daniel','Daniels','Daugherty','Davenport','David','Davidson','Davis','Dawson','Day','Dean','Decker','Dejesus','Delacruz','Delaney','Deleon','Delgado','Dennis','Diaz','Dickerson','Dickson','Dillard','Dillon','Dixon','Dodson','Dominguez','Donaldson','Donovan','Dorsey','Dotson','Douglas','Downs','Doyle','Drake','Dudley','Duffy','Duke','Duncan','Dunlap','Dunn','Duran','Durham','Dyer','Eaton','Edwards','Elliott','Ellis','Ellison','Emerson','England','English','Erickson','Espinoza','Estes','Estrada','Evans','Everett','Ewing','Farley','Farmer','Farrell','Faulkner','Ferguson','Fernandez','Ferrell','Fields','Figueroa','Finch','Finley','Fischer','Fisher','Fitzgerald','Fitzpatrick','Fleming','Fletcher','Flores','Flowers','Floyd','Flynn','Foley','Forbes','Ford','Foreman','Foster','Fowler','Fox','Francis','Franco','Frank','Franklin','Franks','Frazier','Frederick','Freeman','French','Frost','Fry','Frye','Fuentes','Fuller','Fulton','Gaines','Gallagher','Gallegos','Galloway','Gamble','Garcia','Gardner','Garner','Garrett','Garrison','Garza','Gates','Gay','Gentry','George','Gibbs','Gibson','Gilbert','Giles','Gill','Gillespie','Gilliam','Gilmore','Glass','Glenn','Glover','Goff','Golden','Gomez','Gonzales','Gonzalez','Good','Goodman','Goodwin','Gordon','Gould','Graham','Grant','Graves','Gray','Green','Greene','Greer','Gregory','Griffin','Griffith','Grimes','Gross','Guerra','Guerrero','Guthrie','Gutierrez','Guy','Guzman','Hahn','Hale','Haley','Hall','Hamilton','Hammond','Hampton','Hancock','Haney','Hansen','Hanson','Hardin','Harding','Hardy','Harmon','Harper','Harrell','Harrington','Harris','Harrison','Hart','Hartman','Harvey','Hatfield','Hawkins','Hayden','Hayes','Haynes','Hays','Head','Heath','Hebert','Henderson','Hendricks','Hendrix','Henry','Hensley','Henson','Herman','Hernandez','Herrera','Herring','Hess','Hester','Hewitt','Hickman','Hicks','Higgins','Hill','Hines','Hinton','Hobbs','Hodge','Hodges','Hoffman','Hogan','Holcomb','Holden','Holder','Holland','Holloway','Holman','Holmes','Holt','Hood','Hooper','Hoover','Hopkins','Hopper','Horn','Horne','Horton','House','Houston','Howard','Howe','Howell','Hubbard','Huber','Hudson','Huff','Huffman','Hughes','Hull','Humphrey','Hunt','Hunter','Hurley','Hurst','Hutchinson','Hyde','Ingram','Irwin','Jackson','Jacobs','Jacobson','James','Jarvis','Jefferson','Jenkins','Jennings','Jensen','Jimenez','Johns','Johnson','Johnston','Jones','Jordan','Joseph','Joyce','Joyner','Juarez','Justice','Kane','Kaufman','Keith','Keller','Kelley','Kelly','Kemp','Kennedy','Kent','Kerr','Key','Kidd','Kim','King','Kinney','Kirby','Kirk','Kirkland','Klein','Kline','Knapp','Knight','Knowles','Knox','Koch','Kramer','Lamb','Lambert','Lancaster','Landry','Lane','Lang','Langley','Lara','Larsen','Larson','Lawrence','Lawson','Le','Leach','Leblanc','Lee','Leon','Leonard','Lester','Levine','Levy','Lewis','Lindsay','Lindsey','Little','Livingston','Lloyd','Logan','Long','Lopez','Lott','Love','Lowe','Lowery','Lucas','Luna','Lynch','Lynn','Lyons','Macdonald','Macias','Mack','Madden','Maddox','Maldonado','Malone','Mann','Manning','Marks','Marquez','Marsh','Marshall','Martin','Martinez','Mason','Massey','Mathews','Mathis','Matthews','Maxwell','May','Mayer','Maynard','Mayo','Mays','Mcbride','Mccall','Mccarthy','Mccarty','Mcclain','Mcclure','Mcconnell','Mccormick','Mccoy','Mccray','Mccullough','Mcdaniel','Mcdonald','Mcdowell','Mcfadden','Mcfarland','Mcgee','Mcgowan','Mcguire','Mcintosh','Mcintyre','Mckay','Mckee','Mckenzie','Mckinney','Mcknight','Mclaughlin','Mclean','Mcleod','Mcmahon','Mcmillan','Mcneil','Mcpherson','Meadows','Medina','Mejia','Melendez','Melton','Mendez','Mendoza','Mercado','Mercer','Merrill','Merritt','Meyer','Meyers','Michael','Middleton','Miles','Miller','Mills','Miranda','Mitchell','Molina','Monroe','Montgomery','Montoya','Moody','Moon','Mooney','Moore','Morales','Moran','Moreno','Morgan','Morin','Morris','Morrison','Morrow','Morse','Morton','Moses','Mosley','Moss','Mueller','Mullen','Mullins','Munoz','Murphy','Murray','Myers','Nash','Navarro','Neal','Nelson','Newman','Newton','Nguyen','Nichols','Nicholson','Nielsen','Nieves','Nixon','Noble','Noel','Nolan','Norman','Norris','Norton','Nunez','Obrien','Ochoa','Oconnor','Odom','Odonnell','Oliver','Olsen','Olson','Oneal','Oneil','Oneill','Orr','Ortega','Ortiz','Osborn','Osborne','Owen','Owens','Pace','Pacheco','Padilla','Page','Palmer','Park','Parker','Parks','Parrish','Parsons','Pate','Patel','Patrick','Patterson','Patton','Paul','Payne','Pearson','Peck','Pena','Pennington','Perez','Perkins','Perry','Peters','Petersen','Peterson','Petty','Phelps','Phillips','Pickett','Pierce','Pittman','Pitts','Pollard','Poole','Pope','Porter','Potter','Potts','Powell','Powers','Pratt','Preston','Price','Prince','Pruitt','Puckett','Pugh','Quinn','Ramirez','Ramos','Ramsey','Randall','Randolph','Rasmussen','Ratliff','Ray','Raymond','Reed','Reese','Reeves','Reid','Reilly','Reyes','Reynolds','Rhodes','Rice','Rich','Richard','Richards','Richardson','Richmond','Riddle','Riggs','Riley','Rios','Rivas','Rivera','Rivers','Roach','Robbins','Roberson','Roberts','Robertson','Robinson','Robles','Rocha','Rodgers','Rodriguez','Rodriquez','Rogers','Rojas','Rollins','Roman','Romero','Rosa','Rosales','Rosario','Rose','Ross','Roth','Rowe','Rowland','Roy','Ruiz','Rush','Russell','Russo','Rutledge','Ryan','Salas','Salazar','Salinas','Sampson','Sanchez','Sanders','Sandoval','Sanford','Santana','Santiago','Santos','Sargent','Saunders','Savage','Sawyer','Schmidt','Schneider','Schroeder','Schultz','Schwartz','Scott','Sears','Sellers','Serrano','Sexton','Shaffer','Shannon','Sharp','Sharpe','Shaw','Shelton','Shepard','Shepherd','Sheppard','Sherman','Shields','Short','Silva','Simmons','Simon','Simpson','Sims','Singleton','Skinner','Slater','Sloan','Small','Smith','Snider','Snow','Snyder','Solis','Solomon','Sosa','Soto','Sparks','Spears','Spence','Spencer','Stafford','Stanley','Stanton','Stark','Steele','Stein','Stephens','Stephenson','Stevens','Stevenson','Stewart','Stokes','Stone','Stout','Strickland','Strong','Stuart','Suarez','Sullivan','Summers','Sutton','Swanson','Sweeney','Sweet','Sykes','Talley','Tanner','Tate','Taylor','Terrell','Terry','Thomas','Thompson','Thornton','Tillman','Todd','Torres','Townsend','Tran','Travis','Trevino','Trujillo','Tucker','Turner','Tyler','Tyson','Underwood','Valdez','Valencia','Valentine','Valenzuela','Vance','Vang','Vargas','Vasquez','Vaughan','Vaughn','Vazquez','Vega','Velasquez','Velazquez','Velez','Villarreal','Vincent','Vinson','Wade','Wagner','Walker','Wall','Wallace','Waller','Walls','Walsh','Walter','Walters','Walton','Ward','Ware','Warner','Warren','Washington','Waters','Watkins','Watson','Watts','Weaver','Webb','Weber','Webster','Weeks','Weiss','Welch','Wells','West','Wheeler','Whitaker','White','Whitehead','Whitfield','Whitley','Whitney','Wiggins','Wilcox','Wilder','Wiley','Wilkerson','Wilkins','Wilkinson','William','Williams','Williamson','Willis','Wilson','Winters','Wise','Witt','Wolf','Wolfe','Wong','Wood','Woodard','Woods','Woodward','Wooten','Workman','Wright','Wyatt','Wynn','Yang','Yates','York','Young','Zamora','Zimmerman');
    lista_first_name varr := varr( 'Allison', 'Arthur', 'Ana', 'Alex', 'Arlene', 'Alberto', 'Barry', 'Bertha', 'Bill', 'Bonnie', 'Bret', 'Beryl', 'Chantal', 'Cristobal', 'Claudette', 'Charley', 'Cindy', 'Chris', 'Dean', 'Dolly', 'Danny', 'Danielle', 'Dennis', 'Debby', 'Erin', 'Edouard', 'Erika', 'Earl', 'Emily', 'Ernesto', 'Felix', 'Fay', 'Fabian', 'Frances', 'Franklin', 'Florence', 'Gabielle', 'Gustav', 'Grace', 'Gaston', 'Gert', 'Gordon', 'Humberto', 'Hanna', 'Henri', 'Hermine', 'Harvey', 'Helene', 'Iris', 'Isidore', 'Isabel', 'Ivan', 'Irene', 'Isaac', 'Jerry', 'Josephine', 'Juan', 'Jeanne', 'Jose', 'Joyce', 'Karen', 'Kyle', 'Kate', 'Karl', 'Katrina', 'Kirk', 'Lorenzo', 'Lili', 'Larry', 'Lisa', 'Lee', 'Leslie', 'Michelle', 'Marco', 'Mindy', 'Maria', 'Michael', 'Noel', 'Nana', 'Nicholas', 'Nicole', 'Nate', 'Nadine', 'Olga', 'Omar', 'Odette', 'Otto', 'Ophelia', 'Oscar', 'Pablo', 'Paloma', 'Peter', 'Paula', 'Philippe', 'Patty', 'Rebekah', 'Rene', 'Rose', 'Richard', 'Rita', 'Rafael', 'Sebastien', 'Sally', 'Sam', 'Shary', 'Stan', 'Sandy', 'Tanya', 'Teddy', 'Teresa', 'Tomas', 'Tammy', 'Tony', 'Van', 'Vicky', 'Victor', 'Virginie', 'Vince', 'Valerie', 'Wendy', 'Wilfred', 'Wanda', 'Walter', 'Wilma', 'William', 'Kumiko', 'Aki', 'Miharu', 'Chiaki', 'Michiyo', 'Itoe', 'Nanaho', 'Reina', 'Emi', 'Yumi', 'Ayumi', 'Kaori', 'Sayuri', 'Rie', 'Miyuki', 'Hitomi', 'Naoko', 'Miwa', 'Etsuko', 'Akane', 'Kazuko', 'Miyako', 'Youko', 'Sachiko', 'Mieko', 'Toshie', 'Junko');
BEGIN
    DBMS_OUTPUT.PUT_LINE('Inserarea a 4800 de filme->START');
    FOR v_linie IN  (SELECT id,buget,pagina,data_lansare,profit,durata,limba,titlu,gen FROM dbmovies) LOOP     
        insert into filme (id, buget, pagina, data_lansare,profit,durata,limba,titlu,gen) values(v_temp_filme,v_linie.buget,v_linie.pagina,v_linie.data_lansare,v_linie.profit,v_linie.durata,v_linie.limba,v_linie.titlu,v_linie.gen);
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Drama%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Drama');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Action%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Action');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Mystery%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Mystery');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Adventure%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Adventure');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Science Fiction%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Science Fiction');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Fantasy%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Fantasy');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Thriller%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Thriller');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Comedy%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Comedy');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Horror%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Horror');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%History%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'History');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Crime%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Crime');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%War%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'War');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Animation%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Animation');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Family%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Family');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Romance%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Romance');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Western%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Western');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Documentary%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Documentary');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Foreign%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Foreign');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%Music%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'Music');
           v_temp_gen := v_temp_gen+1;
        END IF;
        select count(titlu) into v_aux from filme where id=v_temp_filme and gen like '%TV Movie%';
        IF (v_aux>0) THEN
           insert into genuri values(v_temp_gen,v_temp_filme,'TV Movie');
           v_temp_gen := v_temp_gen+1;
        END IF;
        v_temp_filme := v_temp_filme+1;
    END LOOP;  
    DBMS_OUTPUT.PUT_LINE('Inserarea a 4800 filme->DONE');
    FOR v_i IN 1..1000 LOOP
      IF (DBMS_RANDOM.VALUE(0,100)<70) THEN 
        v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume.count))+1);
          IF (DBMS_RANDOM.VALUE(0,100)<50) THEN      
             v_prenume := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
          ELSE
             v_prenume := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);    
          END IF;
      ELSE
        v_nume := lista_last_name(TRUNC(DBMS_RANDOM.VALUE(0,lista_last_name.count))+1);
        v_prenume := lista_first_name(TRUNC(DBMS_RANDOM.VALUE(0,lista_first_name.count))+1);
      END IF;
      v_aux2 := '';
      LOOP      
        IF (TRUNC(DBMS_RANDOM.VALUE(0,2))=0) THEN
         v_email := lower(v_prenume ||'.'|| v_nume);
         v_email := v_email||v_aux2;
        ELSE
         v_email := lower(v_prenume ||'_'|| v_nume);
         v_email := v_email||v_aux2;
      END IF;
        CASE (TRUNC(DBMS_RANDOM.VALUE(0,4)))
         WHEN 0 THEN v_email := v_email ||'@gmail.com';
         WHEN 1 THEN v_email := v_email ||'@yahoo.com';
         WHEN 2 THEN v_email := v_email ||'@hotmail.com';
         WHEN 3 THEN v_email := v_email ||'@aol.com';
        END CASE;
        v_aux2 := TRUNC(DBMS_RANDOM.VALUE(0,100));
        select count(*) into v_aux from emails where email=v_email;
        exit when v_aux = 0;
      END LOOP;
      v_parola := CHR(FLOOR(DBMS_RANDOM.VALUE(65,91))) || CHR(FLOOR(DBMS_RANDOM.VALUE(97,123))) || CHR(FLOOR(DBMS_RANDOM.VALUE(97,123))) || CHR(FLOOR(DBMS_RANDOM.VALUE(97,123))) || CHR(FLOOR(DBMS_RANDOM.VALUE(97,123))) || CHR(FLOOR(DBMS_RANDOM.VALUE(97,123))) || CHR(FLOOR(DBMS_RANDOM.VALUE(48,58))) || CHR(FLOOR(DBMS_RANDOM.VALUE(48,58)));
      insert into utilizatori values(v_i,v_nume,v_prenume,v_parola);
      insert into emails values (v_i,v_email);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Inserarea a 1000000 utilizatori->DONE');
    select max(id) into v_aux from filme;
    FOR v_linie IN (SELECT id FROM utilizatori) LOOP
       FOR v_i in 1..FLOOR(DBMS_RANDOM.VALUE(1,11)) LOOP
        LOOP
            v_aux2 := FLOOR(DBMS_RANDOM.VALUE(1,v_aux+1));
            select count(*) into v_aux3 from notee where id_utilizator=v_linie.id and id_film=v_aux2;
            exit when v_aux3=0;
        END LOOP;
         INSERT INTO NOTEE VALUES(v_temp_note,v_linie.id,v_aux2,FLOOR(DBMS_RANDOM.VALUE(1,11)));
         v_temp_note := v_temp_note+1;
       END LOOP;
    END LOOP;
END;
/
alter table filme drop column gen;
-- 100.000 de utilizatori - 2224.231 secunde