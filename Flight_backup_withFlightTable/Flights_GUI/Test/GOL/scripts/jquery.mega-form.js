/*
[APLICAÇÃO]
$(document).ready(function(){
	$("input[type='file']").megaform('fileupload');	
	$("select").megaform('dropdownlist');
	$("input[type='text'],textarea").megaform('textbox');
	$("input[type='radio']").megaform('radiobuttonlist');
	$("input[type='checkbox']").megaform('checkboxlist');
});
*/


//***********************************************************************
//EMPRESA			:Tecnologias
//OBJETIVO			:Plugin para Estilização de campos de formulários
//AUTOR				:Cristiano Souza Silva
//Data CRIAÇÃO		:
//MANUTENÇÃO	    :02/06/2011 09:00:22
//OBSERVAÇÃO		:Compatí­vel com jquery-1.5.2.min.js
//************************************************************************

function ProcurarTraduzido()
{
	var strCaminho = window.location.pathname;
	var tamanho = strCaminho.length;
	tamanho = tamanho -1;
	
	strCaminho = strCaminho.substr(1,tamanho);
	strCaminho = strCaminho.substr(0,2);
	
	if(strCaminho == "pt")
		return "procurar";
		
	if(strCaminho == "en")
		return "search";

	if(strCaminho == "es")
		return "buscar";
}

(function($) {

    var methods = {
        init: function(options) {
            return this.each(function() {
                var $this = $(this),
                    data = $this.data('megaform');

                // If the plugin hasn't been initialized yet
                if (!data) {

                    // Do more setup stuff here
                    $(this).data('megaform', {
                        target: $this
                    });
                }
            });
        },
        destroy: function() {
            return this.each(function() {
                var $this = $(this),
                    data = $this.data('megaform');
                $(window).unbind('.megaform');
                data.megaform.remove();
                $this.removeData('megaform');
            })
        },
        
        //Método responsável por customizar controles do tipo dropdownlist
        dropdownlist: function() {
            
            return this.each(function(){
                        	
                //Template html para o campo
            	input = $('<span/>', { 'class': 'TextBox', 'style':'width:auto; max-width:260px; min-width: 80px;'}).text($('option[value=' + $(this).val() + ']', $(this)).text());
            	img = $('<img/>', { 'src': '/Util/Imagens/Botoes/formulario-drop-down-list-seta.png', 'class': 'DropDownListSeta'});
            	
            	//container simulando o dropdown customizado
            	ul = $('<ul/>', { 'class': 'DropDownListItens'}).hide();
            	//Adiciona o evento ao span
            	input.bind('click', function() {
            		            		
            		$(this).attr('disabled', 'disabled');
            		var widthUl = $(this).parentsUntil('.SuperiorEsquerdo').width()-13;
            		if($(this).parentsUntil('.SuperiorEsquerdo').next(ul).css('display')=="none")
            		{
            			if($('.DropDownListItens').find('li').length > 0)
            			{
							$(this).parentsUntil('.SuperiorEsquerdo').next(ul).attr('style', 'z-index:99999;').css('width',widthUl);
            				$('.DropDownListItens').hide();
            				$(this).parentsUntil('.SuperiorEsquerdo').next(ul).show();
            			}
            		}
            		else
            		{
            			$(this).parentsUntil('.SuperiorEsquerdo').next(ul).attr('style', 'z-index:99999;').css('width',widthUl);
            			$(this).parentsUntil('.SuperiorEsquerdo').next(ul).hide();
              		}
            		$(this).removeAttr('disabled');
            	});
            	
            	           	//Adiciona o evento ao span
            	img.bind('click', function() {
            		            		
            		$(this).attr('disabled', 'disabled');	
            		var widthUl = $(this).parentsUntil('.SuperiorEsquerdo').width()-13;
            		
            		if($(this).parentsUntil('.SuperiorEsquerdo').next(ul).css('display')=="none")
            		{
            			if($('.DropDownListItens').find('li').length > 0)
            			{
							$(this).parentsUntil('.SuperiorEsquerdo').next(ul).attr('style', 'z-index:99999;').css('width',widthUl);
            				$('.DropDownListItens').hide();
            				$(this).parentsUntil('.SuperiorEsquerdo').next(ul).show();
            			}
            		}
            		else
            		{
            			$(this).parentsUntil('.SuperiorEsquerdo').next(ul).attr('style', 'z-index:99999;').css('width',widthUl);
            			$(this).parentsUntil('.SuperiorEsquerdo').next(ul).hide();
              		}
            		$(this).removeAttr('disabled');
            	});
            	

				//Adiciona o evento de click no elemento Select oculto            
            	$(this).bind('click', function() {
            	    $(this).prevAll('div:first').find('span').trigger('click');
            	});
	
	
				var currentElement = $(this)
            	//Percorre as opções do dropdown adicionando o item a li
            	$('option', $(this)).each(function() {
            	    
            	    //Se o elemento select não está desabilitado
            	    if(!currentElement.attr('disabled'))
            	    {
            	    	//Recupera o valor do dropdown
            	    	value = $(this).val();
            	    	
            	    	          	    
            	    	//Adiciona uma li a lista e o valor no atributo rel
            	    	ul.append($('<li/>').append($('<a/>', { 'rel': value }).text($(this).text())));
            	    }
            	});
	
            	//Adiciona o evento mouseover da li para alternar a classe
            	$('li', ul).bind('mouseover', function() {           
	
            	    //Remove a classe das outras lis
            	    $(this).parent().children().not(this).removeClass('active');
	
            	    //Adiciona a classe active a li atual
            	    $(this).addClass('active');
            	    
            	//Adiciona o evento mouseout aos itens da lista
            	}).bind('mouseout', function() {
	
            	    //Remove a classe ativa
            	    $(this).removeClass('active');
            	    
            	//Adiciona o evento click aos itens da lista
            	}).bind('click', function(e) {
					
					//Recupera o elemento input (span a ser clicado) atual
					var currentInput = $('.TextBox', $(this).parent().parent());
	
            	    //Recupera o valor referente ao item da lista
            	    currentInput.val($('a', $(this)).attr('rel'));
	
            	    //Exibe o texto selecionado
                	currentInput.text($('a', $(this)).text());
		
					//Esconde o item da li
            	    $(this).parent().hide();

	           	    //Recupera o dropdown oculto
            	    dropdown = $(this).parent().parent().next();
            	    
					//Seleciona o valor do dropdown
            	    dropdown.val(currentInput.val());
            	    
            	    //Aciona o evento change
            	    dropdown.trigger('change');
            	});            
				
            	//Monta o template para o dropdown
            	template = $("<div/>", { 'class': 'SuperiorEsquerdo' }).attr('style', 'height:30px').append($('<div/>', { 'class': 'InferiorDireito' }).attr('style', 'height:30px').append($('<div/>', { 'class': 'InferiorEsquerdo' }).attr('style', 'height:30px').append($('<div/>', { 'class': 'SuperiorDireito' }).attr('style', 'height:30px').append(input).append(img))));
            	$(template).append(ul);
            	
            	//Adiciona o template antes do item atual
            	$(this).before(template);
            	
            	//Oculta o dropdown atual
            	$(this).hide();
            	
			});  	
        },
        
        //Métodos responsável por customizar controles do tipo checkboxlist e checkbox
        checkboxlist: function() {
            
            //Função local que aplica as classes ao checkbox fake
            function checkItem(item, container) {

                //Se o checkbox estiver checado adiciona a classe ativo
                if (item.attr('checked'))
                    $(container).removeClass('CheckBoxList').addClass('CheckBoxListAtivo');
                
                //Senão adiciona a classe inativo
                else
                    $(container).removeClass('CheckBoxListAtivo').addClass('CheckBoxList');
            }
            
            //Percorre os itens aplicando a nova formatação
            return this.each(function() {

                //Cria o template para o checkbox
                template = $("<div/>", { 'class': 'SuperiorEsquerdo' }).append($('<div/>', { 'class': 'InferiorDireito' }).append($('<div/>', { 'class': 'InferiorEsquerdo' }).append($('<div/>', { 'class': 'SuperiorDireito' }).append($("<a/>", { 'class': ($(this).attr('checked')) ? "CheckBoxListAtivo" : "CheckBoxList" })))));

                //Adiciona o novo template antes do checkbox atual
                $(this).before(template);
                
                //Procura o checkbox falso dentro da div anterior ao checkbox verdadeiro
                $(this).prev("div").find('a').click(function() {
                    
                    //Recupera o checkbox verdadeiro
                    input = $(this).parents('.SuperiorEsquerdo:first').next('input');

                    //Aplica a formatação no checkbox fake
                    checkItem(input, $(this));
                    input.trigger('click');
                });
                
                //Adiciona o evento ao checkbox original (para que o label funcione corretamente)
                $(this).bind('click', function(e) {
                    checkItem($(this), $(this).prev('.SuperiorEsquerdo:first').find('a'));
                });
                
                //Oculta o checkbox verdadeiro
                $(this).hide();
            });
        },
        
        //Método responsável por customizar controles do tipo textbox
        textbox: function() {
            return this.each(function() {
                
                //Monta o template
                template = $("<div/>", { 'class': 'SuperiorEsquerdo' }).append($('<div/>', { 'class': 'InferiorDireito' }).append($('<div/>', { 'class': 'InferiorEsquerdo' }).append($('<div/>', { 'class': 'SuperiorDireito' }))));
                
                //Adiciona o elemento atual no meio do template
                $(this).wrap(template);

            });
        },
        
        //Método responsável por customizar controles do tipo radiobutton
        radiobuttonlist: function() {
            function checkItem(item, container) {
                
                //Se o radio estiver checado adiciona a classe ativo
                if (item.attr('checked'))
                    $(container).removeClass('RadioButtonList').addClass('RadioButtonListAtivo');
                
                //Senão adiciona a classe inativo
                else
                    $(container).removeClass('RadioButtonListAtivo').addClass('RadioButtonList');
            }
            return this.each(function() {
                
                //Monta o template
                template = $("<div/>", { 'class': ($(this).attr('checked')) ? "RadioButtonListAtivo" : "RadioButtonList" });
                
                //Adiciona o template antes do objeto atual
                $(this).before(template);
                
                //Adiciona o evento a div
                $(this).prev('div').click(function() {
                    input = $(this).next('input');
                    
                    //Se o checkbox estiver checado
                    if (!input.attr('checked')) {
                        //Remove desmarca o checkbox
                        input.attr('checked', true);
                    }
                               
                    //Aciona o evento click padrão (Postback, caso exista)
                    input.trigger('click');

                });
                
                //Adiciona o evento click ao radiobutton
                $(this).bind('click', function() {
                    
                    //Percorre os itens do radiobutton aplicando a formatação
                    items = $("input[name='" + $(this).attr('name') + "']").each(function() {
                        checkItem($(this), $(this).prev('div'));
                    });
                });
                
                //Oculta o radio 
                $(this).hide();
            });
        },
        
        //Método responsáve por customizar controles do tipo fileupload
        fileupload: function(){
        
        	return this.each(function(){
        		//Cria uma div para conter o FileUploader e o input evitando que 'quebre' 
        		var Container = $('<div class="PositionRelative"></div>');
        
        		var currentElement = $(this);
        		
        		var strProcurar = ProcurarTraduzido();        		        		
        
        		//Cria o elemento que será o template de customização
        		var elemento = $('<div class="FileUpload"><div class="SuperiorEsquerdo" style="float:left;"><div class="InferiorDireito"><div class="InferiorEsquerdo"><div class="SuperiorDireito"><input class="TextBox" readonly="readonly" type="text" style="width:165px;cursor:pointer" /></div></div></div></div><a class="Button" style="cursor:pointer;float:left; display:block; height:28px;"><span>' + strProcurar + '...</span></a></div>');
				
				/*
				-------------------------------
				Como o template é renderizado:
				-------------------------------
				<div class="FileUpload">
					<div class="SuperiorEsquerdo" style="float:left;">
						<div class="InferiorDireito">
							<div class="InferiorEsquerdo">
								<div class="SuperiorDireito">
									<input class="TextBox" readonly="readonly" type="text" style="width:150px;" />
								</div>
							</div>
						</div>
					</div>
					
					<a class="Button" style="float:left; display:block; height:22px;">
						<span>Procurar...</span>
					</a>
				</div>
				*/
				
				//Adiciona a div ANTES do input	
				currentElement.before(Container);
				//Adiciona o input na div
				currentElement.appendTo(Container);	
				//Adiciona o template ANTES do input
				currentElement.before(elemento);
				
				//Esconde o input
				currentElement.css('opacity','0.0');
				currentElement.css('cursor','pointer');
				currentElement.css('font-size','16px');
								
				//Delay de 10 milisegundos para evitar erro
				setTimeout(function(){	
					
					//Configura as propriedades do template
					elemento.css('position','absolute');
					
					//Configura as propriedades do elemento aplicado
					currentElement.width('310px');
					currentElement.height('29px');
					currentElement.css('position', 'relative');
					
				},10);
				
				
				//Atualiza em um intervalo de 1 segundo o texto do arquivo selecionado no input file
				setInterval(function(){
				    $('input[type=text]', elemento).val(currentElement.val());
				}, 1000);
        	});	
        }
    };
     
    $.fn.megaform = function(method){
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist on jQuery.tooltip');
        }
    };

})(jQuery);