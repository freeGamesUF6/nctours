-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2017 a las 03:34:41
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nctours`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `num_pax` int(11) NOT NULL,
  `pvp` double NOT NULL,
  `idtrip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `book`
--

INSERT INTO `book` (`id`, `date`, `num_pax`, `pvp`, `idtrip`) VALUES
(25, '2017-01-26', 1, 2449, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookpax`
--

CREATE TABLE `bookpax` (
  `idbook` int(11) NOT NULL,
  `dnipax` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bookpax`
--

INSERT INTO `bookpax` (`idbook`, `dnipax`) VALUES
(25, '52535352J');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookuser`
--

CREATE TABLE `bookuser` (
  `idbook` int(11) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bookuser`
--

INSERT INTO `bookuser` (`idbook`, `iduser`) VALUES
(25, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `date`
--

CREATE TABLE `date` (
  `id` int(11) NOT NULL,
  `idtrip` int(11) NOT NULL,
  `departuredates` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `date`
--

INSERT INTO `date` (`id`, `idtrip`, `departuredates`) VALUES
(17, 19, '2017-06-12'),
(18, 19, '2017-06-19'),
(19, 19, '2017-06-26'),
(20, 19, '2017-07-03'),
(21, 20, '2017-09-06'),
(22, 20, '2017-09-13'),
(23, 20, '2017-09-20'),
(24, 20, '2017-09-27'),
(25, 21, '2017-07-05'),
(26, 21, '2017-07-12'),
(27, 21, '2017-07-19'),
(28, 21, '2017-07-26'),
(29, 22, '2017-06-19'),
(30, 22, '2017-06-25'),
(31, 22, '2017-07-04'),
(32, 22, '2017-07-09'),
(33, 23, '2017-08-09'),
(34, 23, '2017-08-16'),
(35, 23, '2017-08-23'),
(36, 23, '2017-08-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` int(11) NOT NULL,
  `location` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id`, `name`, `category`, `location`) VALUES
(6, 'Monterey Grasmere', 4, 'Osaka'),
(7, 'Daiwa Roynet', 3, 'Kioto'),
(8, 'Kusakabe Armeria', 3, 'TAKAYAMA'),
(9, 'Resorpia', 3, 'Hakone'),
(10, 'New Otani', 4, 'Tokio'),
(11, 'Pullman Bangkok G', 4, 'Bangkok'),
(12, 'Float House River Kwai', 3, 'Rio Kwai'),
(13, 'Kantary', 4, 'Ayutthaya'),
(14, 'Topland', 4, 'Phitsanuloke'),
(15, 'The Legend Chiang Rai', 4, 'Chiang Rai'),
(16, 'Holiday Inn Chiang Mai', 4, 'Chiang Mai'),
(17, 'Chelsea Hotel', 3, 'Toronto'),
(18, 'Embassy Hotel', 3, 'Ottawa'),
(19, 'Musee Premieres Nations', 4, 'Wendake'),
(20, 'Hotel Lac a o Eau Claire', 4, 'La Mauricie'),
(21, 'Sheraton Center Montreal', 4, 'Montreal'),
(22, 'Casa Andina Miraflores Centro', 3, 'Lima'),
(23, 'Casa Andina Catedral', 3, 'Cuzco'),
(24, 'Hacienda del Valle', 3, 'Valle Sagrado'),
(25, 'Merit San Telmo', 3, 'Buenos Aires'),
(26, 'Sierra Nevada', 3, 'El Calafate'),
(27, 'La Aldea de la Selva Lodge', 4, 'Iguazú');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itinerary`
--

CREATE TABLE `itinerary` (
  `id` int(11) NOT NULL,
  `idtrip` int(11) NOT NULL,
  `day_es` varchar(2000) NOT NULL,
  `day_ca` varchar(2000) NOT NULL,
  `day_en` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `itinerary`
--

INSERT INTO `itinerary` (`id`, `idtrip`, `day_es`, `day_ca`, `day_en`) VALUES
(11, 19, 'ESPAÑA – OSAKA\r\nSalida en vuelo regular hacia Osaka. Noche a bordo.', 'ESPANYA - OSAKA\r\nSortida en vol regular cap a Osaka. Nit a bord.', 'SPAIN - OSAKA\r\nDeparture on regular flight to Osaka. Night on board.'),
(12, 19, 'OSAKA\r\nDesayuno. Visita panorámica de la ciudad, para conocer el Mercado Kuromon (*), el Castillo de Osaka (*) y el Observatorio "Jardín Flotante" en el Edificio Umeda Sky (*). Almuerzo en restaurante local. Alojamiento.', 'OSAKA\r\nEsmorzar. Visita panoràmica de la ciutat, per conèixer el Mercat Kuromon (*), el Castell d''Osaka (*) i l''Observatori "Jardí Flotant" a l''Edifici Umeda Sky (*). Dinar en un restaurant local. Allotjament.', 'OSAKA\r\nBreakfast. Panoramic city tour to visit the Kuromon Market (*), Osaka Castle (*) and the "Floating Garden" Observatory in the Umeda Sky Building (*). Lunch at local restaurant. Accommodation.'),
(13, 19, 'OSAKA - NARA – KIOTO\r\nTraslado a Nara y visita del templo Todaiji con su enorme imagen de Buda (*) y el Parque de los Ciervos Sagrados (*). Almuerzo en restaurante local y visita de Kioto: los templo Kinkakuji (Pabellón Dorado) (*), Castillo Nijo (*) y paseo por el barrio de Gion, famoso por las geishas. Alojamiento.', 'OSAKA - NARA - KYOTO\r\nTrasllat a Nara i visita del temple Todaiji amb la seva enorme imatge de Buda (*) i el Parc dels Cérvols Sagrats (*). Dinar en restaurant local i visita de Kyoto: els temple Kinkakuji (Pavelló Daurat) (*), Castell Nijo (*) i passeig pel barri de Gion, famós per les geishas. Allotjament.', 'OSAKA - NARA - KIOTO\r\nTransfer to Nara and visit Todaiji Temple with its huge image of Buddha (*) and the Park of the Sacred Deer (*). Lunch at a local restaurant and visit of Kyoto: the Kinkakuji Temple (*), Nijo Castle (*) and walk through the Gion district, famous for the geishas. Accommodation.'),
(14, 19, 'KIOTO\r\nDesayuno. Día libre para actividades personales o para realizar una excursión opcional a Hiroshima y Miyajima. Alojamiento.', 'KYOTO\r\nEsmorzar. Dia lliure per a activitats personals o per realitzar una excursió opcional a Hiroshima i Miyajima. Allotjament.', 'KIOTO\r\nBreakfast. Free day for personal activities or to make an optional excursion to Hiroshima and Miyajima. Accommodation.'),
(15, 19, 'KIOTO -  SHIRAKAWAGO - TAKAYAMA – GERO\r\nDesayuno. Salida hacia Shirakawago por carretera o tren. A la llegada, visita de este pueblo declarado Patrimonio de la Humanidad por la UNESCO, en el que podrá conocer una de las casas tradicionales de "Gassho-zukuri" (*). Almuerzo. Salida hacia Takayama. Llegada y visita panorámica de la ciudad para conocer la calle de Kami-Sannomachi y el museo de Carrozas Yatai Kaikan (*). Traslado a Gero. Cena típica japonesa y alojamiento.', 'KYOTO - Shirakawago - TAKAYAMA - GERO\r\nEsmorzar. Sortida cap a Shirakawago per carretera o tren. A l''arribada, visita d''aquest poble declarat Patrimoni de la Humanitat per la UNESCO, en el qual podrà conèixer una de les cases tradicionals de "Gassho-zukuri" (*). Dinar. Sortida cap a Takayama. Arribada i visita panoràmica de la ciutat per conèixer el carrer de Kami-Sannomachi i el museu de Carrosses Yatai Kaikan (*). Trasllat a Gero. Sopar típic japonesa i allotjament.', 'KIOTO - SHIRAKAWAGO - TAKAYAMA - GERO\r\nBreakfast. Departure to Shirakawago by road or train. On arrival, visit this UNESCO World Heritage Site, where you can visit one of the traditional houses of "Gassho-zukuri" (*). Lunch. Departure to Takayama. Arrival and sightseeing tour of the city to visit Kami-Sannomachi Street and Yatai Kaikan Chariots Museum (*). Transfer to Gero. Typical Japanese dinner and accommodation.'),
(16, 19, 'GERO - TSUMAGO - NAGOYA – HAKONE\r\nDesayuno. Traslado a Tsumago. Llegada y paseo por la calle principal del pueblo para conocer "Waki Honjin" (antigua hospedería de los Samurais) (*). Después, traslado a la estación de Nagoya para tomar el tren bala con destino Odawara. Llegada y traslado al hotel en Hakone. Cena y alojamiento.', 'GERO - Tsumago - NAGOYA - HAKONE\r\nEsmorzar. Trasllat a Tsumago. Arribada i passeig pel carrer principal del poble per conèixer "Waki Honjin" (antiga hostatgeria dels Samurais) (*). Després, trasllat a l''estació de Nagoya per agafar el tren bala amb destinació Odawara. Arribada i trasllat a l''hotel a Hakone. Sopar i allotjament.', 'GERO - TSUMAGO - NAGOYA - HAKONE\r\nBreakfast. Transfer to Tsumago. Arrival and walk along the main street of the village to meet "Waki Honjin" (former hostel of the Samurais) (*). Afterwards, transfer to Nagoya station to take the bullet train to Odawara. Arrival and transfer to hotel in Hakone. Dinner and accommodation.'),
(17, 19, 'HAKONE – TOKIO\r\nDesayuno. Visita del Parque Nacional de Hakone para hacer un mini-crucero por el lago Ashi (*) y subir en el teleférico del monte Komagatake (*) para disfrutar de las vistas panorámicas de Hakone y el famoso monte Fuji. Visita del valle de Owakudani (*). Almuerzo. Salida hacia Tokio. Llegada, traslado al hotel y alojamiento.', 'HAKONE - TÒQUIO\r\nEsmorzar. Visita del Parc Nacional d''Hakone per fer un mini-creuer pel llac Ashi (*) i pujar al telefèric de la muntanya Komagatake (*) per gaudir de les vistes panoràmiques de Hakone i el famós mont Fuji. Visita de la vall de Owakudani (*). Dinar. Sortida cap a Tòquio. Arribada, trasllat a l''hotel i allotjament.', 'HAKONE - TOKYO\r\nBreakfast. Visit Hakone National Park for a mini-cruise on Lake Ashi (*) and climb the Mount Komagatake cable car (*) to enjoy panoramic views of Hakone and the famous Mount Fuji. Visit of the Owakudani Valley (*). Lunch. Departure to Tokyo. Arrival, transfer to hotel and overnight.'),
(18, 19, 'TOKIO\r\nDesayuno. Visita panorámica de la ciudad para conocer el Santuario Shintoísta de Meiji (*), la Plaza del Palacio Imperial (*), el Templo Asakusa Kannon con su arcada comercial de Nakamise (*), finalizando en el comercial barrio de Ginza. Almuerzo. Tarde libre (el regreso al hotel lo realizará por su cuenta). Alojamiento.', 'TÒQUIO\r\nEsmorzar. Visita panoràmica de la ciutat per conèixer el Santuari shintoísta de Meiji (*), la Plaça del Palau Imperial (*), el Temple Asakusa Kannon amb la seva arcada comercial de Nakamise (*), finalitzant en el comercial barri de Ginza. Dinar. Tarda lliure (el retorn a l''hotel el realitzarà pel seu compte). Allotjament.', 'TOKYO\r\nBreakfast. Sightseeing tour of the city to visit the Meiji Shinto Shrine (*), Imperial Palace Square (*), Asakusa Kannon Temple with its commercial arcade of Nakamise (*), ending in the commercial district of Ginza. Lunch. Afternoon free (return to the hotel on your own). Accommodation.'),
(19, 19, 'TOKIO – ESPAÑA\r\nDesayuno. A la hora prevista traslado al aeropuerto para tomar un vuelo de regreso a España.', 'TÒQUIO - ESPANYA\r\nEsmorzar. A l''hora prevista trasllat a l''aeroport per agafar un vol de tornada a Espanya.', 'TOKYO - SPAIN\r\nBreakfast. At the scheduled time transfer to the airport to take a flight back to Spain.'),
(20, 20, 'ESPAÑA - BANGKOK\nSalida en vuelo de línea regular con destino Bangkok. Comidas y noche a bordo.', 'ESPANYA - BANGKOK\nSortida en vol de línia regular amb destinació Bangkok. Menjars i nit a bord.', 'SPAIN - BANGKOK\nDeparture in regular flight to Bangkok. Meals and night on board.'),
(21, 20, 'BANGKOK – PARQUE NACIONAL DE ERAWAN – RÍO KWAI\r\nDesayuno. Visita al Parque Nacional de Erawan y sus famosas cataratas, pozas, y bonitas piscinas naturales. Almuerzo. Paseo en bote por el río Kwai y visita al Hellfire Memorial Pass y las cuevas de Lawa. Cena y espectáculo de danzas típicas de la etnia Mon. Alojamiento.', 'BANGKOK - PARC NACIONAL Erawan - riu Kwai\r\nEsmorzar. Visita al Parc Nacional d''Erawan i les seves famoses cataractes, gorgs, i boniques piscines naturals. Dinar. Passeig en pot pel riu Kwai i visita a l''Hellfire Memorial Pass i les coves de Lawa. Sopar i espectacle de danses típiques de l''ètnia Mon. Allotjament.', 'BANGKOK - ERAWAN NATIONAL PARK - KWAI RIVER\r\nBreakfast. Visit the Erawan National Park and its famous waterfalls, pools, and beautiful natural pools. Lunch. Boating on the Kwai River and visit to the Hellfire Memorial Pass and the Lawa Caves. Dinner and show of typical dances of the Mon ethnic group. Accommodation.'),
(22, 20, 'RÍO KWAI - AYUTTHAYA\r\nDesayuno. Visita del famoso Puente sobre el río Kwai, el Museo de la Guerra Jeath y paseo en en el “Tren de la Muerte” disfrutando la belleza del paisaje. Almuerzo. Salida hacia Ayutthaya. Cena y alojamiento.', 'Riu Kwai - Ayutthaya\r\nEsmorzar. Visita del famós Pont sobre el riu Kwai, el Museu de la Guerra JEATH i passeig en al "Tren de la Mort" gaudint la bellesa del paisatge. Dinar. Sortida cap a Ayutthaya. Sopar i allotjament.', 'KWAI RIVER - AYUTTHAYA\r\nBreakfast. Visit the famous bridge over the Kwai River, Jeath War Museum and ride on the "Death Train" enjoying the beauty of the landscape. Lunch. Departure to Ayutthaya. Dinner and accommodation.'),
(23, 20, 'AYUTTHAYA – LOPBURI - PHITSANULOKE\r\nDesayuno. Visita de las ruinas de Ayutthaya y sus maravillosos templos. Almuerzo. Salida hacia Lopburi y visita al  Templo de los Monos, las ruinas de Wat Phra Sri Ratana Maha That y Prang Sam Yod (La Pagoda Sagrada). Continuación hasta Phitsanuloke. Cena y alojamiento.', 'Ayutthaya - Lopburi - PHITSANULOKE\r\nEsmorzar. Visita de les ruïnes d''Ayutthaya i els seus meravellosos temples. Dinar. Sortida cap a Lopburi i visita al Temple dels Micos, les ruïnes de Wat Phra Sri Ratana Maha That i Prang Sam Yod (La Pagoda Sagrada). Continuació fins Phitsanuloke. Sopar i allotjament.', 'AYUTTHAYA - LOPBURI - PHITSANULOKE\r\nBreakfast. Visit the ruins of Ayutthaya and its wonderful temples. Lunch. Departure to Lopburi and visit the Temple of the Monkeys, the ruins of Wat Phra Sri Ratana Maha That and Prang Sam Yod (The Sacred Pagoda). Continue to Phitsanuloke. Dinner and accommodation.'),
(24, 20, 'PHITSANULOKE – SUKHOTHAI – CHIANG RAI\r\nDesayuno. Visita al templo Wat Phra Sri Ratana Mahathat. Continuación y visita al Parque Histórico de Sukhotai, Patrimonio de la Humanidad, los jardines, ruinas, lago y el gran Buda Blanco de Wat Sri Chum. Almuerzo. Continuación hacia Chiang Rai, parando en el Lago Payao. Llegada, cena y alojamiento.', 'PHITSANULOKE - Sukhothai - CHIANG RAI\r\nEsmorzar. Visita al temple Wat Phra Sri Ratana Mahathat. Continuació i visita al Parc Històric de Sukhotai, Patrimoni de la Humanitat, els jardins, ruïnes, llac i el gran Buda Blanc de Wat Sri Chum. Dinar. Continuació cap a Chiang Rai, parant al Llac Payao. Arribada, sopar i allotjament.', 'PHITSANULOKE - SUKHOTHAI - CHIANG RAI\r\nBreakfast. Visit to the temple Wat Phra Sri Ratana Mahathat. Continuation and visit to Sukhotai Historical Park, World Heritage Site, gardens, ruins, lake and the great White Buddha of Wat Sri Chum. Lunch. Continue to Chiang Rai, stopping at Lake Payao. Arrival, dinner and accommodation.'),
(25, 20, 'CHIANG RAI – CHIANG MAI\r\nDesayuno. Visita en barco tradicional de las minorías étnicas Karen y Lahu. Continuación a Chiang Mai por carretera, con almuerzo en ruta. Llegada a Chiang Mai, donde disfrutará de una cena Kantoke amenizada con antiguas danzas del norte. Alojamiento.', 'CHIANG RAI - CHIANG MAI\r\nEsmorzar. Visita amb vaixell tradicional de les minories ètniques Karen i Lahu. Continuació a Chiang Mai per carretera, amb dinar en ruta. Arribada a Chiang Mai, on gaudirà d''un sopar Kantoke amenitzada amb antigues danses del nord. Allotjament.', 'CHIANG RAI - CHIANG MAI\r\nBreakfast. Traditional boat tour of Karen and Lahu ethnic minorities. Continue to Chiang Mai by road, with lunch en route. Arrival in Chiang Mai, where you will enjoy a Kantoke dinner enlivened with ancient dances from the north. Accommodation.'),
(26, 20, 'CHIANG MAI\r\nDesayuno. Salida y visita al Centro de Adiestramiento, donde se realizará un paseo en elefante. Almuerzo en la granja de las orquídeas. Por la tarde salida para visita de las famosas “mujeres jirafa”, el templo Wat Doi Suthep y las fábricas de artesanías de Sankampaeng. Cena y alojamiento.', 'CHIANG MAI\r\nEsmorzar. Sortida i visita al Centre d''Ensinistrament, on es realitzarà un passeig en elefant. Dinar a la granja de les orquídies. A la tarda sortida per visita de les famoses "dones girafa", el temple Wat Doi Suthep i les fàbriques d''artesanies de Sankampaeng. Sopar i allotjament.', 'CHIANG MAI\r\nBreakfast. Departure and visit to the Training Center, where an elephant ride will be made. Lunch at the orchid farm. In the afternoon, visit the famous "giraffe women", the Wat Doi Suthep temple and the Sankampaeng handicraft factories. Dinner and accommodation.'),
(27, 20, 'CHIANG MAI – BANGKOK\r\nDesayuno.Visita de los templos más importantes de Bangkok: Wat Trimitr, con su Buda de oro macizo, Wat Po con su Buda reclinado y chedis (tumbas) de los reyes, y del Gran Palacio, un bello ejemplo de arquitectura tradicional antiguamente utilizado como residencia real, y que alberga el templo del Buda Esmeralda. Tarde libre. Alojamiento.', 'CHIANG MAI - BANGKOK\r\nDesayuno.Visita dels temples més importants de Bangkok: Wat Trimitr, amb el seu Buda d''or massís, Wat Po amb el seu Buda reclinat i chedis (tombes) dels reis, i del Gran Palau, un bell exemple d''arquitectura tradicional antigament utilitzat com residència reial, i que alberga el temple del Buda Esmeralda. Tarda lliure. Allotjament.', 'CHIANG MAI - BANGKOK\r\nBreakfast. Visit the most important temples of Bangkok: Wat Trimitr, with its solid gold Buddha, Wat Po with its reclining Buddha and chedis (tombs) of kings, and the Grand Palace, a beautiful example of traditional architecture formerly used as Royal residence, and which houses the Temple of the Emerald Buddha. Free afternoon. Accommodation.'),
(28, 20, 'BANGKOK\r\nDesayuno. Día libre para recorrer la ciudad, realizar las últimas compras o relajarse en las cómodas instalaciones de su hotel. vuelo de regreso. Noche a bordo.', 'BANGKOK\r\nEsmorzar. Dia lliure per recórrer la ciutat, realitzar les últimes compres o relaxar-se en les còmodes instal·lacions del seu hotel. vol de tornada. Nit a bord.', 'Bangkok\r\nBreakfast. Free day to tour the city, make the last purchases or relax in the comfortable facilities of your hotel. return flight. Night on board.'),
(29, 21, 'ESPAÑA - TORONTO\r\nSalida en vuelo regular con destino Toronto. Llegada al aeropuerto de Toronto, recepción y traslado al hotel. Resto del día libre. Alojamiento.', 'ESPANYA - TORONTO\r\nSortida en vol regular amb destinació Toronto. Arribada a l''aeroport de Toronto, recepció i trasllat a l''hotel. Resta del dia lliure. Allotjament.', 'SPAIN - TORONTO\r\nDeparture in regular flight to Toronto. Arrival at Toronto airport, reception and transfer to the hotel. Rest of the day at leisure. Accommodation.'),
(30, 21, 'TORONTO - NIÁGARA FALLS – TORONTO\r\nDesayuno. Visita de esta ciudad, la mayor de Canadá y capital de la provincia de Ontario con el centro financiero, el  antiguo y nuevo Ayuntamiento, la avenida University, el Parlamento provincial, la Universidad de Toronto, el distinguido barrio Yorkville, el  barrio chino - segundo en importancia de Canadá – la Torre CN, la estructura independiente más alta del hemisferio occidental con sus orgullosos 553.33 metros y que es visitada por más de 2 millones de personas cada año. Continuación a Niágara on-the-Lake. Haremos una parada para recorrer la calle principal. Continuación a Niágara por el camino panorámico que bordea el río del mismo nombre.  Allí  nos esperan las majestuosas y famosas cataratas que deslumbrarán con su impresionante caudal de agua y que son una de las  mayores atracciones en Norteamérica. Paseo en barco Hornblower hasta el centro de la herradura que forman las famosas cataratas.  Regreso por la tarde hasta Toronto y alojamiento.', 'TORONTO - NIÀGARA FALLS - TORONTO\r\nEsmorzar. Visita d''aquesta ciutat, la més gran de Canadà i capital de la província d''Ontario amb el centre financer, l''antic i nou Ajuntament, l''avinguda University, el Parlament provincial, la Universitat de Toronto, el distingit barri Yorkville, el barri xinès - segon en importància de Canadà - la Torre CN, l''estructura independent més alta de l''hemisferi occidental amb els seus orgullosos 553.33 metres i que és visitada per més de 2 milions de persones cada any. Continuació a Niagara on-the-Lake. Farem una parada per recórrer el carrer principal. Continuació a Niagara pel camí panoràmic que voreja el riu del mateix nom. Allà ens esperen les majestuoses i famoses cataractes que enlluernaran amb el seu impressionant cabal d''aigua i que són una de les majors atraccions a Amèrica del Nord. Passeig en vaixell Hornblower fins al centre de la ferradura que formen les famoses cataractes. Retorn a la tarda fins Toronto i allotjament.', 'TORONTO - NIÁGARA FALLS - TORONTO\r\nBreakfast. Visit of this city, the largest of Canada and capital of the province of Ontario with the financial center, the old and new City Hall, University Avenue, Provincial Parliament, University of Toronto, distinguished Yorkville neighborhood, Chinatown In importance of Canada - the CN Tower, the highest independent structure in the Western Hemisphere with its proud 553.33 meters and which is visited by more than 2 million people every year. Continue to Niagara on-the-Lake. We will make a stop to cross the main street. Continuation to Niagara by the panoramic road that borders the river of the same name. There awaits us the majestic and famous waterfalls that will dazzle with its impressive water flow and which are one of the biggest attractions in North America. Hornblower boat ride to the center of the horseshoe that forms the famous waterfalls. Return in the afternoon to Toronto and overnight.'),
(31, 21, 'TORONTO - 1000 ISLAS - OTTAWA\r\nDesayuno. Salida por la autorruta Transcanadiense  hacia Ottawa. La zona de 1000 Islas es una de las más hermosas y románticas del país en donde realizaremoss una excursión de una hora en barco para admirar estas islas y sus mansiones y curiosidades en el  nacimiento del río San Lorenzo. Continuación hacia la capital del país que sorprenderá por su bella arquitectura y geografía en el margen del Rio Ottawa. Alojamiento.', 'TORONTO - 1000 ILLES - OTTAWA\r\nEsmorzar. Sortida per la autorruta Transcanadenca cap a Ottawa. La zona de 1000 Illes és una de les més boniques i romàntiques del país on realizaremoss una excursió d''una hora en vaixell per admirar aquestes illes i les seves mansions i curiositats en el naixement del riu Sant Llorenç. Continuació cap a la capital del país que sorprendrà per la seva bella arquitectura i geografia al marge del Rio Ottawa. Allotjament.', 'TORONTO - 1000 ISLANDS - OTTAWA\r\nBreakfast. Departure by Trans-Canada Highway to Ottawa. The area of 1000 Islands is one of the most beautiful and romantic of the country where we will make an excursion of an hour by boat to admire these islands and their mansions and curiosities in the birth of the San Lorenzo river. Continuation to the capital of the country that will surprise by its beautiful architecture and geography in the margin of the Ottawa River. Accommodation.'),
(32, 21, 'OTTAWA – TREMBLANT - QUEBEC\r\nDesayuno. Salida hacia la capital de la provincia homónima, Quebec. Atravesaremos el río Ottawa para llegar a la Provincia de Québec y hacia los montes Laurentinos, llenos de lagos y ríos que son el paraíso de las actividades al exterior. Tendremos la oportunidad de hacer un alto en el simpático pueblo de Tremblant. Tiempo libre. Continuación para visitar una plantación de arces en donde se produce la famosa miel de Arce con métodos tradicionales y en donde tendremos un almuerzo típico de leñadores. Continuación hacia Quebec. Llegada y visita panorámica de la ciudad más antigua del país, con sus muros rodeando al Viejo Quebec. Visitaremos la parte alta y baja, la Plaza de Armas, las Planicies de Abraham también llamados Campos de Batalla, la Plaza Royal y el Parlamento de la provincia. Alojamiento.\r\n', 'OTTAWA - Tremblant - QUEBEC\r\nEsmorzar. Sortida cap a la capital de la província homònima, Quebec. Travessarem el riu Ottawa per arribar a la Província de Quebec i les muntanyes Laurentines, plens de llacs i rius que són el paradís de les activitats a l''exterior. Tindrem l''oportunitat de fer una parada en el simpàtic poble de Tremblant. Temps lliure. Continuació per visitar una plantació d''aurons on es produeix la famosa mel de Arce amb mètodes tradicionals i on tindrem un esmorzar típic de llenyataires. Continuació cap a Quebec. Arribada i visita panoràmica de la ciutat més antiga del país, amb els seus murs envoltant al Vell Quebec. Visitarem la part alta i baixa, la plaça d''Armes, les Planes d''Abraham també anomenats Camps de Batalla, la Plaça Royal i el Parlament de la província. Allotjament.', 'OTTAWA - TREMBLANT - QUEBEC\r\nBreakfast. Departure to the capital of the homonymous province, Quebec. We will cross the Ottawa River to reach the Province of Quebec and the Laurentinos mountains, full of lakes and rivers that are the paradise of outdoor activities. We will have the opportunity to stop in the charming village of Tremblant. Free time. Continuation to visit a plantation of maples where the famous honey of Arce is produced with traditional methods and where we will have a typical lunch of woodcutters. Continue to Quebec. Arrival and panoramic tour of the oldest city in the country, with its walls surrounding Old Quebec. We will visit the upper and lower part, the Plaza de Armas, the Plains of Abraham also called Battlefields, Royal Plaza and the Parliament of the province. Accommodation.'),
(33, 21, 'QUEBEC – SAGUENAY\r\nDesayuno. Salida por la mañana para disfrutar de una día inolvidable en un paisaje de naturaleza sin límite.  Descubrimos la belleza de este vasto país en compañía de guías naturalistas. Hay varias actividades previstas para este día como un seminario de introducción a los osos y otros temas interesantes del parque. Después, salida hacia el bosque Laurenciano. Disfrute de la interpretación que le ofrecerá su guía durante la caminata en medio de la naturaleza. Con su remo en mano, es tiempo de embarcar en una canoa Rabaska y remar en aguas vírgenes, tal como lo hacían los indios (botas e impermeables incluidos). Disfrute después de un almuerzo tipo picnic, a orillas de un lago. Por la tarde, salida hasta un mirador para observar los osos negros en su ambiente natural. Salida hacia a la región del Saguenay y llegada a su hotel. Alojamiento.', 'QUEBEC - SAGUENAY\r\nEsmorzar. Sortida al matí per gaudir d''una dia inoblidable en un paisatge de naturalesa sense límit. Descobrim la bellesa d''aquest vast país en companyia de guies naturalistes. Hi ha diverses activitats previstes per a aquest dia com un seminari d''introducció als óssos i altres temes interessants del parc. Després, sortida cap al bosc Laurenciano. Gaudiu de la interpretació que li oferirà la seva guia durant la caminada enmig de la natura. Amb la seva rem en mà, és temps d''embarcar en una canoa Rabaska i remar en aigües verges, tal com ho feien els indis (botes i impermeables inclosos). Gaudiu després d''un dinar tipus picnic, a la vora d''un llac. A la tarda, sortida fins a un mirador per observar els óssos negres en el seu ambient natural. Sortida cap a la regió del Saguenay i arribada al seu hotel. Allotjament.', 'QUEBEC - SAGUENAY\r\nBreakfast. Departure in the morning to enjoy an unforgettable day in an unlimited nature landscape. We discover the beauty of this vast country in the company of naturalist guides. There are several activities planned for this day as an introduction seminar to the bears and other interesting themes of the park. Then, exit towards the Laurentian forest. Enjoy the interpretation that your guide will offer during the hike in the middle of nature. With its paddle in hand, it is time to embark on a Rabaska canoe and paddle in virgin waters, just as the Indians did (boots and raincoats included). Enjoy after a picnic lunch, by the lake. In the afternoon, departure to a viewpoint to observe black bears in their natural environment. Departure to the Saguenay region and arrival at your hotel. Accommodation.'),
(34, 21, 'SAGUENAY – TADOUSSAC – LA MALBAIE\r\nDesayuno. Salida por la ribera norte del fiordo situado más al sur del hemisferio norte. Parada en el pueblo de Ste Rose du Nord para admirar el fiordo y los alrededores. Continuación hasta el pueblo de Tadoussac y visita de sus famosas dunas de arena, con vista panorámicas del mar. Almuerzo en el famoso Hotel Tadoussac, antes de salir para un crucero safari de observación de ballenas. Al final de la tarde, continuación hasta el imponente hotel Fairmont Manoir Richelieu; un castillo situado sobre un acantilado de frente al majestuoso río San Lorenzo. Llegada, tiempo libre y alojamiento.', 'Saguenay - Tadoussac - LA Malbaie\r\nEsmorzar. Sortida per la ribera nord del fiord situat més al sud de l''hemisferi nord. Parada al poble de Ste Rose du Nord per admirar el fiord i els voltants. Continuació fins al poble de Tadoussac i visita de les seves famoses dunes de sorra, amb vista panoràmica sobre el mar. Dinar al famós Hotel Tadoussac, abans de sortir per a un creuer safari d''observació de balenes. Al final de la tarda, continuació fins l''imponent hotel Fairmont Manoir Richelieu; un castell situat sobre un penya-segat de davant del majestuós riu Sant Llorenç. Arribada, temps lliure i allotjament.', 'SAGUENAY - TADOUSSAC - LA MALBAIE\r\nBreakfast. Departure by the north bank of the fjord located to the south of the northern hemisphere. Stop in the village of Ste Rose du Nord to admire the fjord and the surroundings. Continue to the village of Tadoussac and visit its famous sand dunes, with panoramic views of the sea. Lunch at the famous Tadoussac Hotel, before heading out for a whale watching safari cruise. At the end of the afternoon, continue to the imposing Fairmont Manoir Richelieu; A castle located on a cliff facing the majestic St. Lawrence River. Arrival, free time and accommodation.'),
(35, 21, 'LA MALBAIE – WENDAKE\r\nDesayuno. Salida hasta la Costa de Beaupre con su camino real y sus antiguas casas rurales. Parada en el magnífico Canyon de Santa Ana con su bella cascada y puentes suspendidos. Después veremos la encantadora Isla de Orleans, en donde podrá observar sus bellísimos pueblos, y las Cataratas Montmorency, que con sus 83 metros de altura. Llegada y visita a la reserva indígena de Wendake. Traslado hasta el Hotel-Musée Premières Nations, con su arquitectura exterior original y su decorado interior de inspiración indígena. Posibilidad de visitar el museo Huron-Wendat o tiempo para pasear bordeando el río que pasa por frente del hotel. Cena en el restaurante del hotel. Alojamiento.', 'L''Malbaie - Wendake\r\nEsmorzar. Sortida fins a la Costa d''Beaupre amb el seu camí real i les seves antigues cases rurals. Parada al magnífic Canyon de Santa Anna amb la seva bella cascada i ponts suspesos. Després veurem la encantadora Illa d''Orleans, on podrà observar els seus bellíssims pobles, i les Cataractes Montmorency, que amb els seus 83 metres d''altura. Arribada i visita a la reserva indígena de Wendake. Trasllat fins a l''Hotel-Musée Premières Nations, amb la seva arquitectura exterior original i el seu decorat interior d''inspiració indígena. Possibilitat de visitar el museu Huron-Wendat o temps per passejar vorejant el riu que passa per davant de l''hotel. Sopar al restaurant de l''hotel. Allotjament.', 'LA MALBAIE - WENDAKE\r\nBreakfast. Departure to the Coast of Beaupre with its royal road and its old rural houses. Stop at the magnificent Santa Ana Canyon with its beautiful waterfall and suspended bridges. Then we will see the charming island of Orleans, where you can see its beautiful villages, and the Montmorency Falls, which is 83 meters high. Arrival and visit to the Wendake Indian Reservation. Transfer to Hotel-Musée Premières Nations, with its original exterior architecture and its interior decoration of indigenous inspiration. Possibility to visit the Huron-Wendat museum or time to stroll along the river that passes in front of the hotel. Dinner at the hotel restaurant. Accommodation.'),
(36, 21, 'LA MAURICIE – MONTREAL\r\nDesayuno. Salida en dirección a Montreal. Al llegar, iniciaremos la visita de esta vibrante ciudad, segunda mayor de lengua francesa en el mundo con su estadio Olímpico, la calle St-Laurent, el barrio de la Milla Cuadrada de Oro de Montreal en donde se encuentra la famosa universidad de McGill y el parque del Monte Real en donde se encuentra el lago de los castores. En camino al Viejo Montreal veremos el barrio Le Plateau Mont Royal, la plaza de Armas, donde se encuentra la Basílica de Notre Dame de Montreal, la Plaza Cartier y el Ayuntamiento de Montreal. Resto del día libre. Alojamiento.', 'La Mauricie - MONT-REAL\r\nEsmorzar. Sortida en direcció a Mont-real. En arribar, iniciarem la visita d''aquesta vibrant ciutat, segona major de llengua francesa al món amb el seu estadi Olímpic, el carrer St-Laurent, al barri de la Milla Quadrada d''Or de Mont-real en on es troba la famosa universitat de McGill i el parc de la Muntanya Reial on es troba el llac dels castors. En camí al Vell Mont-real veurem el barri Li Plateau Mont Royal, la plaça d''Armes, on es troba la Basílica de Notre Dame de Montreal, la Plaça Cartier i l''Ajuntament de Mont-real. Resta del dia lliure. Allotjament.', 'LA MAURICIE - MONTREAL\r\nBreakfast. Departure to Montreal. Upon arrival, we will begin the visit of this vibrant, second largest French-speaking city in the world with its Olympic stadium, St-Laurent Street, Montreal''s Golden Square neighborhood where the famous McGill University is located. The park of the Monte Real where is the lake of the beavers. On the way to Old Montreal we will see the Le Plateau Mont Royal district, the Place de Armas, where you will find Notre Dame de Montreal, Cartier Square and Montreal City Hall. Rest of the day at leisure. Accommodation.'),
(37, 21, 'MONTREAL - ESPAÑA\r\nDesayuno. Traslado al aeropuerto, para salir en su vuelo de regreso a España. Noche a bordo.', 'MONT-REAL - ESPANYA\r\nEsmorzar. Trasllat a l''aeroport, per sortir en el seu vol de tornada a Espanya. Nit a bord.', 'MONTREAL - SPAIN\r\nBreakfast. Transfer to the airport, to leave on your flight back to Spain. Night on board.'),
(38, 22, 'ESPAÑA – LIMA\r\nSalida en vuelo de línea regular hacia Lima. Llegada, traslado al hotel y alojamiento.', 'ESPANYA - LIMA\r\nSortida en vol de línia regular cap a Lima. Arribada, trasllat a l''hotel i allotjament.', 'SPAIN - LIME\r\nScheduled flight to Lima. Arrival, transfer to hotel and overnight.'),
(39, 22, 'LIMA\r\nDesayuno y visita de la ciudad incluyendo el Centro Histórico con la Catedral, el Convento de Santo Domingo y San Francisco y la Plaza Mayor entre otros monumentos. Continuación por los barrios residenciales de San Isidro y Miraflores, para seguir al Museo Arqueológico. Resto de la tarde libre. Alojamiento.', 'LIMA\r\nEsmorzar i visita de la ciutat incloent el Centre Històric amb la Catedral, el Convent de Sant Domingo i Sant Francesc i la Plaça Major entre d''altres monuments. Continuació pels barris residencials de Sant Isidre i Miraflores, per seguir al Museu Arqueològic. Resta de la tarda lliure. Allotjament.', 'LIME\r\nBreakfast and visit of the city including the Historical Center with the Cathedral, the Convent of Santo Domingo and San Francisco and the Plaza Mayor among other monuments. Continue through the residential neighborhoods of San Isidro and Miraflores, to follow the Archaeological Museum. Rest of the afternoon free. Accommodation.'),
(40, 22, 'LIMA - CUZCO\r\nDesayuno. Traslado al aeropuerto para tomar el vuelo que nos llevará a Cuzco, la antigua capital del imperio. Llegada y traslado al hotel. Visita peatonal de la ciudad, circuito exclusivo que contempla la visita a la plaza del barrio de San Blas, calle Hatunrumiyoc con la “piedra de los 12 ángulos”, plazoleta Nazarenas, plaza de armas, Museo Inca, Mercado Central de Cuzco), Calle Loreto, visita interior a la Catedral y al templo del Koricancha o Templo del Sol. Alojamiento.', 'LIMA - CUZCO\r\nEsmorzar. Trasllat a l''aeroport per agafar el vol que ens portarà a Cusco, l''antiga capital de l''imperi. Arribada i trasllat a l''hotel. Visita de vianants de la ciutat, circuit exclusiu que contempla la visita a la plaça del barri de Sant Blai, carrer Hatunrumiyoc amb la "pedra dels 12 angles", placeta Nazarenas, plaça d''armes, Museu Inca, Mercat Central de Cusco), Carrer Loreto, visita interior de la Catedral i al temple del Koricancha o temple del Sol. Allotjament.', 'LIMA - CUZCO\r\nBreakfast. Transfer to the airport to take the flight that will take us to Cuzco, the ancient capital of the empire. Arrive and transfer to the hotel. Pedestrian visit of the city, exclusive circuit that includes the visit to the square of San Blas neighborhood, Hatunrumiyoc street with the "stone of the 12 angles", Nazarenas square, Plaza de armas, Inca Museum, Cuzco Central Market), Street Loreto, inside visit to the Cathedral and to the temple of the Koricancha or Temple of the Sun. Accommodation.'),
(41, 22, 'CUZCO  –  VALLE SAGRADO\r\nDesayuno. Salida por carretera hacia el Valle Sagrado de los Incas, visitando el pueblo andino de Chinchero donde visitaremos además de su zona arqueológica,  su colonial iglesia, su plaza principal donde a diario es posible visitar su  mercadillo artesanal. Continuación a las Minas de Sal de Maras, el Laboratorio Agrícola de Moray y Ollantaytambo con su fortaleza. Almuerzo. Por la tarde salida en el tren hacia el pueblo de Aguas Calientes. Llegada y traslado al hotel. Resto de la tarde libre. Cena y alojamiento.', 'CUZCO - VALL SAGRADA\r\nEsmorzar. Sortida per carretera cap a la Vall Sagrada dels Inques, visitant el poble andí de Chinchero on visitarem a més de la seva zona arqueològica, la seva colonial església, la seva plaça principal on diàriament és possible visitar la seva mercat artesanal. Continuació a les Mines de Sal de Maras, el Laboratori Agrícola de Moray i Ollantaytambo amb la seva fortalesa. Dinar. A la tarda sortida al tren cap al poble d''Aigües Calentes. Arribada i trasllat a l''hotel. Resta de la tarda lliure. Sopar i allotjament.', 'CUZCO - SACRED VALLEY\r\nBreakfast. Departure by road to the Sacred Valley of the Incas, visiting the Andean town of Chinchero where we will visit in addition to its archaeological zone, its colonial church, its main square where daily it is possible to visit its handmade market. Continuation to the Salt Mines of Maras, the Agricultural Laboratory of Moray and Ollantaytambo with its strength. Lunch. In the afternoon, departure by train to the town of Aguas Calientes. Arrive and transfer to the hotel. Rest of the afternoon free. Dinner and accommodation.'),
(42, 22, 'VALLE SAGRADO – MACHU PICCHU\r\n Desayuno. A la hora programada, salida en el tren hacia el pueblo de Aguas Calientes, subida en autobús hasta la ciudadela de Machu Picchu. Visita guiada del complejo arqueológico. Tiempo libre para disfrutar de una de las maravillas de mundo moderno.  Regreso a Aguas Calientes y salida en tren con regreso a Ollantaytambo y traslado al hotel  en el Valle. Alojamiento.', 'VALL SAGRADA - MACHU PICCHU\r\n  Esmorzar. A l''hora programada, sortida al tren cap al poble d''Aigües Calentes, pujada amb autobús fins a la ciutadella de Machu Picchu. Visita guiada del complex arqueològic. Temps lliure per gaudir d''una de les meravelles de món modern. Retorn a Aguas Calientes i sortida amb tren amb retorn a Ollantaytambo i trasllat a l''hotel a la Vall. Allotjament.', 'VALLE SAGRADO - MACHU PICCHU\r\n  Breakfast. At the scheduled time, departure on the train to the town of Aguas Calientes, bus ride to the citadel of Machu Picchu. Guided tour of the archaeological complex. Free time to enjoy one of the wonders of the modern world. Return to Aguas Calientes and departure by train back to Ollantaytambo and transfer to the hotel in the Valley. Accommodation.'),
(43, 22, 'VALLE SAGRADO - CUZCO\r\nDesayuno. Por la mañana, traslado de retorno a Cuzco, haciendo una breve parada en el mercado de Pisac. Llegada a la capital.  Por la tarde visita de las Ruinas Aledañas, donde destacan Sacsayhuaman,  Tambomachay y Q´enqo. Alojamiento.', 'VALL SAGRADA - CUZCO\r\nEsmorzar. Al matí, trasllat de tornada a Cusco, fent una breu parada al mercat de Pisac. Arribada a la capital. A la tarda visita de les Ruïnes limítrofes, on destaquen Sacsayhuaman, Tambomachay i Q''enqo. Allotjament.', 'VALLE SAGRADO - CUZCO\r\nBreakfast. In the morning, transfer back to Cuzco, making a brief stop in the Pisac market. Arrival to the capital. In the afternoon visit the nearby ruins, where you can find Sacsayhuaman, Tambomachay and Q''enqo. Accommodation.'),
(44, 22, 'CUZCO\r\nDesayuno. Día libre donde podrá  continuar con la visita de  esta monumental ciudad rica en colores, aromas y sonidos. Alojamiento.', 'CUZCO\r\nEsmorzar. Dia lliure on podrà continuar amb la visita d''aquesta monumental ciutat rica en colors, aromes i sons. Allotjament.', 'CUZCO\r\nBreakfast. Free day where you can continue with the visit of this monumental city rich in colors, aromas and sounds. Accommodation.'),
(45, 22, 'CUZCO  – LIMA – ESPAÑA\r\nDesayuno. A la hora indicada traslado al aeropuerto para volar con destino Lima y enlace con el vuelo de regreso a España. Noche a bordo.', 'CUZCO - LIMA - ESPANYA\r\nEsmorzar. A l''hora indicada trasllat a l''aeroport per volar amb destinació Lima i enllaç amb el vol de tornada a Espanya. Nit a bord.', 'CUZCO - LIMA - SPAIN\r\nBreakfast. At the indicated time transfer to the airport to fly to Lima and link with the flight back to Spain. Night on board.'),
(46, 22, 'ESPAÑA\r\nLlegada y fin de nuestros servicios.', 'ESPANYA\r\nArribada i fi dels nostres serveis.', 'SPAIN\r\nArrival and end of our services.'),
(47, 23, 'ESPAÑA – BUENOS AIRES\r\nSalida en vuelo de línea regular hasta Buenos Aires. Noche a bordo.', 'ESPANYA - BUENOS AIRES\r\nSortida en vol de línia regular fins a Buenos Aires. Nit a bord. ', 'SPAIN - BUENOS AIRES\r\nRegular flight to Buenos Aires. Night on board.'),
(48, 23, 'BUENOS AIRES\r\nLlegada y traslado al hotel.  Durante este día se realizará la visita de la ciudad de medio día. Alojamiento.', 'BUENOS AIRES\r\nArribada i trasllat a l''hotel. Durant aquest dia es realitzarà la visita de la ciutat de mig dia. Allotjament.', 'BUENOS AIRES\r\nArrival and transfer to the hotel. During this day the city will be visited half a day. Accommodation. '),
(49, 23, 'BUENOS AIRES\r\nDesayuno. Día libre para seguir disfrutando de los encantos que esta ciudad puede ofrecer al visitante. Alojamiento.', 'BUENOS AIRES\r\nEsmorzar. Dia lliure per seguir gaudint dels encants que aquesta ciutat pot oferir al visitant. Allotjament. ', 'BUENOS AIRES \r\nBreakfast. Free day to continue enjoying the charms that this city can offer the visitor. Accommodation. '),
(50, 23, 'BUENOS AIRES – EL CALAFATE\r\nDesayuno. Traslado al aeropuerto y salida en vuelo regular hacia El Calafate. Llegada y traslado al hotel Resto del día libre. Alojamiento.', 'BUENOS AIRES - EL CALAFATE\r\nEsmorzar. Trasllat a l''aeroport i sortida en vol regular cap a El Calafate. Arribada i trasllat a l''hotel Resta del dia lliure. Allotjament. ', 'BUENOS AIRES - EL CALAFATE Breakfast. Transfer to the airport and departure in regular flight to El Calafate. Arrival and transfer to hotel Rest of the day at leisure. Accommodation. '),
(51, 23, 'EL CALAFATE\r\nDesayuno. Salida en excursión para visitar el espectacular Glaciar Perito Moreno, situado en el Parque Nacional de los Glaciares y declarado Herencia Mundial por la UNESCO en 1999. A continuación se realizará la navegación Safari Náutico. Regreso al hotel y alojamiento.', 'EL CALAFATE\r\nEsmorzar. Sortida a excursió per visitar l''espectacular Glacera Perito Moreno, situat al Parc Nacional de les Glaceres i declarat Herència Mundial per la UNESCO el 1999. A continuació es realitzarà la navegació Safari Nàutic. Retorn a l''hotel i allotjament. ', 'CALAFATE \r\nBreakfast. Departure on excursion to visit the spectacular Perito Moreno Glacier, located in Glaciers National Park and declared World Heritage by UNESCO in 1999. Next, the Nautical Safari will be made. Return to the hotel and overnight. '),
(52, 23, 'EL CALAFATE\r\nDesayuno. Día libre para poder realizar excursiones opcionales. Alojamiento.\r\n', 'EL CALAFATE\r\nEsmorzar. Dia lliure per poder fer excursions opcionals. Allotjament. ', 'CALAFATE \r\nBreakfast. Free day to be able to make optional excursions. Accommodation. '),
(53, 23, 'EL CALAFATE - IGUAZÚ\r\nDesayuno. Traslado al aeropuerto y salida en vuelo regular hacia Buenos Aires, donde se hará conexión con otro vuelo destino Iguazú. Llegada y traslado al hotel.  Alojamiento.', 'EL CALAFATE - IGUAÇÚ\r\nEsmorzar. Trasllat a l''aeroport i sortida en vol regular cap a Buenos Aires, on es farà connexió amb un altre vol amb destinació Iguazú. Arribada i trasllat a l''hotel. Allotjament. ', 'EL CALAFATE - IGUAZÚ \r\nBreakfast. Transfer to the airport and departure in regular flight to Buenos Aires, where you will connect with another flight to Iguazu. Arrive and transfer to the hotel. Accommodation. '),
(54, 23, 'IGUAZÚ\r\nDesayuno. Visita de las Cataratas de Iguazú por el lado argentino, donde podrá disfrutar de las espectaculares vistas de esta maravilla de la naturaleza. Alojamiento.\r\n', 'IGUAÇÚ\r\nEsmorzar. Visita de les Cataractes d''Iguazú pel costat argentí, on podrà gaudir de les espectaculars vistes d''aquesta meravella de la natura. Allotjament. ', 'IGUAZÚ \r\nBreakfast. Visit the Iguazu Falls on the Argentine side, where you can enjoy the spectacular views of this wonder of nature. Accommodation. '),
(55, 23, 'IGUAZÚ – BUENOS AIRES - ESPAÑA\r\nDesayuno. Día para seguir disfrutando de las Cataratas pero desde el lado brasileño. A la hora indicada traslado al aeropuerto para embarcar en vuelo con destino Buenos Aires. Llegada, traslado entre aeropuertos y embarque con destino España. Noche a bordo.', ' IGUAZÚ - BUENOS AIRES - ESPANYA\r\nEsmorzar. Dia per seguir gaudint de les Cataractes però des del costat brasiler. A l''hora indicada trasllat a l''aeroport per embarcar en vol amb destinació Buenos Aires. Arribada, trasllat entre aeroports i embarcament amb destinació Espanya. Nit a bord.', 'IGUAZU - BUENOS AIRES - SPAIN\r\nBreakfast. Day to continue enjoying the Falls but from the Brazilian side. At the indicated time transfer to the airport to board flight to Buenos Aires. Arrival, transfer between airports and boarding with destination to Spain. Night on board. ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pax`
--

CREATE TABLE `pax` (
  `dni` varchar(9) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(250) NOT NULL,
  `dob` date NOT NULL,
  `passport` varchar(15) NOT NULL,
  `passportexpiry` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pax`
--

INSERT INTO `pax` (`dni`, `name`, `surname`, `dob`, `passport`, `passportexpiry`) VALUES
('12345678A', 'Jimmy', 'Joe', '1979-01-04', 'CAT12345ZAS', '2029-01-04'),
('25368545G', 'Xavier', 'Baños', '2017-05-26', 'ES567356BB', '2017-05-26'),
('44885522Q', 'Richie', 'Perkins', '0000-00-00', '55221148582QW', '0000-00-00'),
('46454545A', 'Mungo', 'Jerry', '0000-00-00', '98232346854SD', '0000-00-00'),
('52525252L', 'manolo', 'escobar', '2017-05-28', 'ES4467356BB', '2017-05-28'),
('52535352J', 'xavier', 'baños', '2017-05-31', 'ES448641BB', '2017-05-31'),
('55446678A', 'mis', 'mus', '1975-01-15', 'ES12345ZAS', '2020-01-15'),
('74185296D', 'Pancha', 'Villa', '1982-01-10', 'ME23456ZAS', '2025-01-10'),
('74185296S', 'Pancho', 'Villa', '1977-01-10', 'ME12345ZAS', '2025-01-10'),
('98765432B', 'Vinnie', 'LLoe', '1978-01-07', 'CAT12345ZAM', '2028-01-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trip`
--

CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `duration` varchar(200) DEFAULT NULL,
  `pricesingle` double NOT NULL,
  `suplement` double DEFAULT NULL,
  `departurefirst` date NOT NULL,
  `departurelast` date NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `descripcion_es` varchar(1000) NOT NULL,
  `descripcion_ca` varchar(1000) NOT NULL,
  `descripcion_en` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trip`
--

INSERT INTO `trip` (`id`, `name`, `duration`, `pricesingle`, `suplement`, `departurefirst`, `departurelast`, `image`, `descripcion_es`, `descripcion_ca`, `descripcion_en`) VALUES
(19, 'Contrastes de Japón', '9', 2449, NULL, '2017-06-12', '2017-07-03', '/resources/images/trip/Contrastes de Japón/fuji.jpg', 'Japón es un país de contrastes, como descubrirá en este recorrido que le llevará desde las modernas calles de Osaka hasta los neones de Tokio, conociendo en su itinerario la herencia más tradicional nipona en Kioto, Gero y Hakone.', 'Japó és un país de contrastos, com descobrirà en aquest recorregut que el portarà des de les modernes carrers d''Osaka fins als neons de Tòquio, coneixent en el seu itinerari l''herència més tradicional nipona a Kyoto, Gero i Hakone.', 'Japan is a country of contrasts, as you will discover in this tour that will take you from the modern streets of Osaka to the neon of Tokyo, knowing in its itinerary the most traditional Japanese heritage in Kyoto, Gero and Hakone.'),
(20, 'Tailandia al Completo', '9', 1750, NULL, '2017-09-06', '2017-09-27', '/resources/images/trip/Tailandia al Completo/Thailand.jpg', 'El recorrido más completo para disfrutar de bellos y desconocidos rincones de singular belleza en su recorrido por Tailandia, además de la vibrante Bangkok y todos aquellos lugares históricos, templos y ciudades que un viajero no debe dejar de visitar en el País de las Sonrisas.', 'El recorregut més complet per gaudir de bells i desconeguts racons de singular bellesa en el seu recorregut per Tailàndia, a més de la vibrant Bangkok i tots aquells llocs històrics, temples i ciutats que un viatger no ha de deixar de visitar al País de les Somriures.', 'The most complete route to enjoy beautiful and unknown places of unique beauty in your tour of Thailand, as well as the vibrant Bangkok and all those historical places, temples and cities that a traveler should not miss visiting in the Land of Smiles.'),
(21, 'Canadá Original Salvaje', '9', 2500, NULL, '2017-07-05', '2017-07-26', '/resources/images/trip/Canadá Original Salvaje/canada.jpg', 'Esta propuesta de itinerario le permitirá conocer lo mejor de las provincias de Ontario y Québec. Recorrido por las principales ciudades del este canadiense, combinadas con espacios naturales como las Cataratas del Niágara, la Región de Mil Islas y la bella zona de lagos y bosques de La Mauricie.', 'Aquesta proposta d''itinerari us permetrà conèixer el millor de les províncies d''Ontario i Quebec. Recorregut per les principals ciutats de l''est canadenc, combinades amb espais naturals com les Cascades del Niàgara, la Regió de Mil Illes i la bonica zona de llacs i boscos de la Mauricie.', 'This itinerary proposal will allow you to know the best of the provinces of Ontario and Quebec. Tour of the main cities of Eastern Canada, combined with natural spaces such as the Niagara Falls, the Thousand Islands Region and the beautiful lake and forest area of La Mauricie.'),
(22, 'Esencias de Perú', '9', 1700, NULL, '2017-06-19', '2017-07-09', '/resources/images/trip/Esencias de Perú/peru.jpg', 'Viva el espíritu peruano en este viaje que le guiará hacia la quintaesencia de este país: desde Lima, una fuente inagotable de cultura con espléndidos ejemplos de arquitectura colonial, pasando por el Valle Sagrado, hasta Cuzco y el enigmático Machu Picchu escondido en la selva.', 'Visca l''esperit peruà en aquest viatge que us guiarà cap a la quinta essència d''aquest país: des de Lima, una font inesgotable de cultura amb esplèndids exemples d''arquitectura colonial, passant per la Vall Sagrada, fins Cusco i l''enigmàtic Machu Picchu amagat a la selva.', 'Experience the Peruvian spirit in this trip that will guide you to the quintessence of this country: from Lima, an inexhaustible source of culture with splendid examples of colonial architecture, passing through the Sacred Valley to Cuzco and the enigmatic Machu Picchu hidden in the jungle.'),
(23, 'Argentina - Buenos Aires, El Calafate e Iguazú', '9', 2070, NULL, '2017-08-09', '2017-08-09', '/resources/images/trip/Argentina - Buenos Aires, El Calafate e Iguazú/buenosAires.jpg', 'Conozca todos los extremos de Argentina; desde su sofisticada capital, hasta la “helada” cordillera patagónica. Vivirá el silencio de los bosques milenarios y la majestad de las cumbres donde la naturaleza se desborda en picos de granito y campos de hielo, que derraman sus lenguas glaciares en lagos de belleza inigualable.', 'Conegui tots els extrems d''Argentina; des de la seva sofisticada capital, fins a la "gelada" serralada patagònica. Viurà el silenci dels boscos mil·lenaris i la majestat dels cims on la natura es desborda en pics de granit i camps de gel, que vessen les seves llengües glaceres en llacs de bellesa inigualable.', 'Know all the extremes of Argentina; From its sophisticated capital, to the "frosty" Patagonian mountain range. You will live the silence of the ancient forests and the majesty of the peaks where nature overflows in peaks of granite and ice fields, that spill their glacial tongues in lakes of incomparable beauty.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `triphotels`
--

CREATE TABLE `triphotels` (
  `idtrip` int(11) NOT NULL,
  `idhotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `triphotels`
--

INSERT INTO `triphotels` (`idtrip`, `idhotel`) VALUES
(19, 6),
(19, 7),
(19, 8),
(19, 9),
(19, 10),
(20, 11),
(20, 12),
(20, 13),
(20, 14),
(20, 15),
(20, 16),
(21, 17),
(21, 18),
(21, 19),
(21, 20),
(21, 21),
(22, 22),
(22, 23),
(22, 24),
(23, 25),
(23, 26),
(23, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tripimage`
--

CREATE TABLE `tripimage` (
  `id` int(11) NOT NULL,
  `idtrip` int(11) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tripimage`
--

INSERT INTO `tripimage` (`id`, `idtrip`, `url`) VALUES
(17, 19, '/resources/images/trip/Contrastes de Japón/fuji.jpg'),
(18, 19, '/resources/images/trip/Contrastes de Japón/osaka.jpg'),
(19, 19, '/resources/images/trip/Contrastes de Japón/tokio.jpg'),
(20, 20, '/resources/images/trip/Tailandia al Completo/Thailand.jpg'),
(21, 20, '/resources/images/trip/Tailandia al Completo/bangkok.jpg'),
(22, 20, '/resources/images/trip/Tailandia al Completo/krabi.jpg'),
(23, 21, '/resources/images/trip/Canadá Original Salvaje/jasper.jpg'),
(24, 21, '/resources/images/trip/Canadá Original Salvaje/quebec.jpg'),
(25, 21, '/resources/images/trip/Canadá Original Salvaje/toronto.jpg'),
(26, 22, '/resources/images/trip/Esencias de Perú/peru4.jpg'),
(27, 22, '/resources/images/trip/Esencias de Perú/peru2.jpg'),
(28, 22, '/resources/images/trip/Esencias de Perú/peru3.jpg'),
(29, 23, '/resources/images/trip/Argentina - Buenos Aires, El Calafate e Iguazú/buenosAires2.jpg'),
(30, 23, '/resources/images/trip/Argentina - Buenos Aires, El Calafate e Iguazú/buenosAires3.jpg'),
(31, 23, '/resources/images/trip/Argentina - Buenos Aires, El Calafate e Iguazú/buenosAires4.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(3, 'admin@admin', '$2a$10$HknefvfVMnrjmvu.GvrGO./ixmj/jtU3EjthdWl5JrH7nYuzAUQKu'),
(4, 'user@user.net', '$2a$10$f2M9rBCjScO.NG0UsugcRuJNhgVErDvUDLuDXYtSnoqajJW5o1EE6'),
(5, 'admin@admin.com', '$2a$10$lyDyZ/nzIURndyHhrj8yNu61dHfi/XQ24xZ/hlGsIN/XNTFPvpNM2'),
(6, 'genialviatges@gmail.com', '$2a$10$WIUAecFuXc/neiL06z7Uh./hQnV7dK.pvBJB/y.iVQ3qZ23dQpO1q');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtrip` (`idtrip`);

--
-- Indices de la tabla `bookpax`
--
ALTER TABLE `bookpax`
  ADD PRIMARY KEY (`idbook`,`dnipax`),
  ADD KEY `dnipax` (`dnipax`);

--
-- Indices de la tabla `bookuser`
--
ALTER TABLE `bookuser`
  ADD PRIMARY KEY (`idbook`,`iduser`),
  ADD KEY `iduser` (`iduser`);

--
-- Indices de la tabla `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtrip` (`idtrip`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `itinerary`
--
ALTER TABLE `itinerary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtrip` (`idtrip`);

--
-- Indices de la tabla `pax`
--
ALTER TABLE `pax`
  ADD PRIMARY KEY (`dni`),
  ADD UNIQUE KEY `passport` (`passport`);

--
-- Indices de la tabla `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `triphotels`
--
ALTER TABLE `triphotels`
  ADD PRIMARY KEY (`idtrip`,`idhotel`),
  ADD KEY `idhotel` (`idhotel`);

--
-- Indices de la tabla `tripimage`
--
ALTER TABLE `tripimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tripimage_ibfk_1` (`idtrip`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `date`
--
ALTER TABLE `date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `itinerary`
--
ALTER TABLE `itinerary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT de la tabla `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `tripimage`
--
ALTER TABLE `tripimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`idtrip`) REFERENCES `trip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bookpax`
--
ALTER TABLE `bookpax`
  ADD CONSTRAINT `bookpax_ibfk_1` FOREIGN KEY (`idbook`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookpax_ibfk_2` FOREIGN KEY (`dnipax`) REFERENCES `pax` (`dni`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bookuser`
--
ALTER TABLE `bookuser`
  ADD CONSTRAINT `bookuser_ibfk_1` FOREIGN KEY (`idbook`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookuser_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `date`
--
ALTER TABLE `date`
  ADD CONSTRAINT `date_ibfk_1` FOREIGN KEY (`idtrip`) REFERENCES `trip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `itinerary`
--
ALTER TABLE `itinerary`
  ADD CONSTRAINT `itinerary_ibfk_1` FOREIGN KEY (`idtrip`) REFERENCES `trip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `triphotels`
--
ALTER TABLE `triphotels`
  ADD CONSTRAINT `triphotels_ibfk_1` FOREIGN KEY (`idtrip`) REFERENCES `trip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `triphotels_ibfk_2` FOREIGN KEY (`idhotel`) REFERENCES `hotel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tripimage`
--
ALTER TABLE `tripimage`
  ADD CONSTRAINT `tripimage_ibfk_1` FOREIGN KEY (`idtrip`) REFERENCES `trip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
