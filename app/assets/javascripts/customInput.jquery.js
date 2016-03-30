/*-------------------------------------------------------------------- 
 * jQuery plugin: customInput()
 * by Maggie Wachs and Scott Jehl, http://www.filamentgroup.com
 * Copyright (c) 2009 Filament Group
 * Dual licensed under the MIT (filamentgroup.com/examples/mit-license.txt) and GPL (filamentgroup.com/examples/gpl-license.txt) licenses.
 * Article: http://www.filamentgroup.com/lab/accessible_custom_designed_checkbox_radio_button_inputs_styled_css_jquery/  
 * Usage example below (see comment "Run the script...").
--------------------------------------------------------------------*/


jQuery.fn.customInput = function(){
	$(this).each(function(i){	
		if($(this).is('[type=checkbox],[type=radio]')){
			var input = $(this);
			
			// get the associated label using the input's id
			var label = input.next();
			
			//get type, for classname suffix 
			var inputType = (input.is('[type=checkbox]')) ? 'checkbox' : 'radio';
			
			// wrap the input + label in a div 
			$('<div class="custom-'+ inputType +'"></div>').insertBefore(input).append(input, label);
			
			// find all inputs in this set using the shared name attribute
			var allInputs = $('input[id='+input.attr('id')+']');
			
			// necessary for browsers that don't support the :hover pseudo class on labels
			label.on('click', function(e){
				if(!!input.prop('checked')){ 
					input.prop("checked", false);
					$(this).removeClass('checked');
				}else{
					input.prop("checked", true);
					$(this).addClass('checked');
				}
        e.stopPropagation()
        return false;
			});
			
			//bind custom event, trigger it, bind click,focus,blur events					
			input.on('updateState', function(){	
				if (!!input.prop('checked')) {
					if (input.prop('type') == 'radio') {				
						allInputs.each(function(){ 
							$(this).next().removeClass('checked');
						});		
					};
					label.addClass('checked');
				}
				else { label.removeClass('checked checkedHover checkedFocus'); }
										
			})
			.trigger('updateState')
			.on('click', function(){ 
				$(this).trigger('updateState'); 
			})
			.on('focus', function(){ 
				label.addClass('focus'); 
				if(inputType == 'checkbox' && !!input.prop('checked')){ 
					$(this).addClass('checkedFocus'); 
				} 
			})
			.on('blur', function(){ label.removeClass('focus checkedFocus'); });
		}
	});
};

	
	
