/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// INPUTS IMAGES
   $(document).ready(function () {
            var max_fields = 3; //maximum input boxes allowed
            var wrapper = $(".input_fields_wrap"); //Fields wrapper
            var add_button = $(".add_field_button"); //Add button ID
            var x = 0; //initlal text box count
            $(add_button).click(function (e) { //on add input button click
                e.preventDefault();
                if (x < max_fields) { //max input box allowed
                    $(wrapper).append('<div clas="col-xs-6" ><input type="file" accept="image/png, image/jpeg" name="files" class="form-control"><a href="#" class="input-group-addon remove_field">Remove</a><hr /></div>'); //add input box
                    x++; //text box increment
                }
            });
            $(wrapper).on("click", ".remove_field", function (e) { //user click on remove text
                e.preventDefault();
                $(this).parent('div').remove();
                x--;
            })
        });
        
        // TEXTAREA ITINERARY
        $(document).ready(function () {
            var max_fields = 10; //maximos inputs
            var wrapper = $(".input_div"); //donde se crearran los input
            var add_button = $(".add_button"); //boton de añadir inputs
            var x = 2; // variable auxiliar
            $(add_button).click(function (e) { //añadir boton al hacer clic
                e.preventDefault();
                if (x < max_fields) { //filtro de inputs
                    $(wrapper).append('<div> Day ' + x + '<textarea type="text" class="form-control" name="day" >description itinerary</textarea><a href="#" class="input-group-addon remove_input">Remove</a><hr /></div>'); //inputs
                    x++; //text box increment
                }
            });
            $(wrapper).on("click", ".remove_input", function (e) { //Eliminar input
                e.preventDefault();
                $(this).parent('div').remove();
                x--;
            })
        });