/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.organization.naturecitytours.trip;

import java.awt.Image;
import java.io.File;
import static java.lang.reflect.Array.set;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.HashSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;

/**
 *
 * @author Mark
 */
@Controller
public class TripController {

    private TripRepository trip;
    private ImagesRepository img;
    private DateRepository date;
    private ItineraryRepository itinerary;
    private HotelRepository hotel;

    private Trip tr = new Trip();
    private DateTrip da = new DateTrip();
    private Itinerary it = new Itinerary();

    @Autowired
    public TripController(TripRepository trip, ImagesRepository img, DateRepository date, ItineraryRepository it, HotelRepository hotel) {
        this.trip = trip;
        this.img = img;
        this.date = date;
        this.itinerary = it;
        this.hotel = hotel;

    }

    /**
     * Metodo para aceder a un Trip por ID
     *
     * @param ownerId the ID of the owner to display
     * @return a ModelMap with the model attributes for the view
     */
    @RequestMapping("/trip/{tripId}")
    public ModelAndView showOTrip(@PathVariable("tripId") int tripId) {
        ModelAndView mav = new ModelAndView("trip/trip");

        //System.out.println("ideeee" + tripId);
        Trip trip = this.trip.findById(tripId);
        //Collection<Images> i =  this.img.findById(tripId);

        Set<Images> e = trip.getImg();

        for (Images i : e) {
            System.out.println("imagenes " + i.getUrl());
        }
        mav.addObject(trip);

        //mav.addObject(i);
        return mav;
    }

    /**
     * Mètode que recupera un viatge determinat o una llista de viatges si el
     * paràmetre de cerca és buit
     *
     * @param trip
     * @param result
     * @param model
     * @return vista per mostrar la llista de viatges o el viatge seleccionat
     * segons escaigui
     */
    @RequestMapping("/trip/list")
    public String tripList(Trip trip, BindingResult result, Map<String, Object> model) {
        // allow parameterless GET request for /trips to return all records
        if (trip.getName() == null) {
            trip.setName(""); // empty string signifies broadest possible search
        }

        // find trips bys name
        Collection<Trip> results = this.trip.findByName(trip.getName());
        if (results.isEmpty()) {
            // no trips found
            result.rejectValue("name", "notFound", "not found");
            Collection<Trip> res = this.trip.findAll();
            model.put("tripList", res);
            return "trip/tripList";
        } //        else if (results.size() == 1) {
        //            // 1 trip found
        //            trip = results.iterator().next();
        //            return "redirect:/trip/" + trip.getId();
        //        } 
        else {
            // multiple trips found
            model.put("selections", results);
            Collection<Trip> res = this.trip.findAll();
            model.put("list", res);
            return "trip/tripList";
        }

    }

    /**
     * Mètode que permet guardar un nou viatge a la base de dades
     *
     * @param t
     * @return
     */
    @RequestMapping("/saveTrip")
    public String saveTrip(Trip t) {
        this.trip.save(tr);
        return "hello";
    }

    /**
     * Mètode que permet guardar un nou viatge a la base de dades
     *
     * @param t
     * @return
     */
    @RequestMapping(value = "/trip/new", method = RequestMethod.GET)
    public String formTrip(Map<String, Object> model) {
        Trip trip = new Trip();
        DateTrip date = new DateTrip();
        Collection<Hotel> hoteles = this.hotel.findAll();
        
    
        model.put("trip", trip);
        model.put("date", date);
        model.put("hoteles", hoteles);
        return "/trip/tripNew";
    }
    
      @RequestMapping(value = "/trip/new/errors", method = RequestMethod.GET)
    public String formTripErrors(Map<String, Object> model,HttpServletRequest request) {
        
        String r =request.getParameter("result");
        
          System.out.println("errorreees " + r);
        Trip trip = new Trip();
        DateTrip date = new DateTrip();
        Collection<Hotel> hoteles = this.hotel.findAll();
        
    
        model.put("trip", trip);
        model.put("date", date);
        model.put("hoteles", hoteles);
        return "/trip/tripNew";
    }

    /**
     * 
     * @param model // modelo para reenviar a otro controlador
     * @param trip // Objeto Trip 
     * @param result // Objeto BindindResult con los errores que se pudieran producir
     * @param firstDate //Dia del primer vuelo del viaje
     * @param lastDate //Dia del último vuelo del viaje
     * @param file  // Imagen de portada del viaje 
     * @param ddates // Lista de fechas de los dias disponibles del viaje
     * @param day_es //Descripción de los itinerarios en Español
     * @param day_ca //Descripción de los itinerarios en Catalán
     * @param day_en //Descripción de los itinerarios en Ingles
     * @param hoteles // Hoteles que incluyen en el viaje
     * @param files // Pack de imagenes para Slider
     * @return 
     */
    @RequestMapping(value = "/trip/new", method = RequestMethod.POST)
    public ModelAndView addTrip(
            Model model,
            @Valid Trip trip,
            BindingResult result,
            @RequestParam("firts") String firstDate,
            @RequestParam("last") String lastDate,
            @RequestParam("file") MultipartFile file,
            @RequestParam("departuredates") String[] ddates,
            @RequestParam("day_es") String[] day_es,
            @RequestParam("day_ca") String[] day_ca,
            @RequestParam("day_en") String[] day_en,
            @RequestParam("hoteles") Long[] hoteles,
            @ModelAttribute ImagesForm files) {
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView("/trip/tripNew");
           
            DateTrip datew = new DateTrip();
            Collection<Hotel> hotelesw = this.hotel.findAll();
            
           List<ObjectError> f =  result.getAllErrors();
            for (ObjectError fe : f){
                System.out.println(fe.getCodes()[1] +"error - "+ fe.getDefaultMessage());
               
            }
            mav.addObject("date", datew);
            mav.addObject("hoteles", hotelesw);
            mav.addObject("result", result.getAllErrors());
            return mav;
        } else {

            String rootPath = "src/main/resources/static/resources/images/trip";
            String relativePath = "/resources/images/trip";

            String defaulImgPath = "/resources/images/logo.png";

            // Creamos en el directorio raiz ('images'), un direcetorio con el NOMBRE que nos llega por el formulario
            File dir = new File(rootPath + File.separator + trip.getName());
            if (!dir.exists()) {
                dir.mkdirs();
            }

            //Sí no ha introducido una imagen en el formulario se creara uno por defecto
            if (!file.isEmpty()) {
                // Creamos el archivo en el directorio creado anteriormente
                File imageFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());

                trip.InserFile(file, imageFile);

                //Seteamos la imagen de portada de Trip
                String imag = relativePath + "/" + trip.getName() + "/" + file.getOriginalFilename();
                trip.setImage(imag);
            } else {

                trip.setImage(defaulImgPath);
            }

            //GUARDA DE FECHA DE SALIDA
            DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
            Date newDate = new Date();

            try {
                newDate = df.parse(firstDate);
                trip.setDeparturefirst(newDate);

                newDate = df.parse(lastDate);
                trip.setDeparturelast(newDate);

            } catch (ParseException e) {
                System.out.println("Error en la primera o ultima fecha");
            }

            //guardar Hoteles
            if (hoteles != null) {
                Set<Hotel> HotelList = new HashSet<Hotel>();
                for (Long hotel : hoteles) {
                    try {
                        Hotel ho = this.hotel.findById(hotel);
                        System.out.println("hotelessss " + ho.getName());
                        HotelList.add(ho);

                    } catch (Exception r) {
                        System.out.println("No existe el hotel con id: " + hotel);
                    }

                }
                trip.setHotels(HotelList);
            }
            this.trip.save(trip);
            //Pack de imagenes del trip
            //Iteramos las imagenes uno a uno 
            if (files.getFiles() != null) {
                for (MultipartFile image : files.getFiles()) {

                    //Sí no se ha introducido ninguna imagen agragamos una por defecto
                    System.out.println("imagenes " + image.getOriginalFilename());
                    if (!image.isEmpty()) {

                        // Creamos el archivo de las imagenes dentro del directorio con el nombre del juego.
                        File imageFile = new File(dir.getAbsolutePath() + File.separator + image.getOriginalFilename());

                        //Guardamos la imagen con en el proyecto
                        trip.InserFile(image, imageFile);

                        //creamos una nuevo objeto image por cada imagen del pack
                        Images i = new Images();

                        i.setIdtrip(trip);

                        //Seteamos la url relativa para la base de datos
                        String urlImg = relativePath + "/" + trip.getName() + "/" + image.getOriginalFilename();
                        i.setUrl(urlImg);

                        //guardamos la imagen en la base de datos
                        this.img.save(i);
                    }

                }
            }

            //Guarda Fechas
            try {
                System.out.println("hoooooooooooooooola");
            df = new SimpleDateFormat("yyyy-mm-dd");
                for (String date : ddates) {
                    if(date != null){
                       
                    DateTrip dates = new DateTrip();
                    dates.setIdtrip(trip);
                    newDate = df.parse(date);
                    dates.setDeparturedates(newDate);
                    this.date.save(dates);
                    }else{
                        System.out.println("fecha vacia");
                    }
                }

            } catch (ParseException e) {
                System.out.println("errore en  las fechas");
            }

            //guarda Itinerearios
             
            int i = 0;
        while(i< day_es.length){
             Itinerary iti = new Itinerary();
             iti.setDay_es(day_es[i]);
             System.out.println("day ca "+ day_ca[i]);
             iti.setDay_ca(day_ca[i]);
             iti.setDay_en(day_en[i]);
             iti.setTrip(trip);
             this.itinerary.save(iti);
             i++;
        }

        }
        return new ModelAndView("redirect:/trip/list");
        //return "ARCHIVO VACIO";
    }
    
     @RequestMapping("/trip/delete/{id}")
    public String deleteTrip(@PathVariable("id") String tripId){
        int idtrip=Integer.parseInt(tripId);
        this.trip.removeById(idtrip);
        
        return "redirect:/trip/list";
    }
}
