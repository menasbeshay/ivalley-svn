$(".Atendimento .Busca .Content ul li ul li a.Referencia").click(function(){
       var valor = $(this).text();
       $(".Atendimento .Busca .TextBox").val(valor);
       return(false);
});



/*----------------------------------------------------------------------------------------------------------------------------------
Todas as funções que forem funcionar APÓS o carregamento do DOM, inserir DENTRO desta declaração  ' $(document).ready(function(){) '  
----------------------------------------------------------------------------------------------------------------------------------*/
$(document).ready(function () {
/*------------------------------------------------------------
	Função utilizada na home de Destinos (Filtro)
------------------------------------------------------------*/


     $('input[alt=date]').datepicker();
        
        $('input[alt=rangeinput]').rangeinput({ progress: true });
        
        $('input[alt=rangeinput]').val('R$ ' + $('input[alt=rangeinput]').val());
        
        $('input[alt=rangeinput]').change(function()
        {
            valor = $('input[alt=rangeinput]').val();
            $('input[alt=rangeinput]').val('');
            $('input[alt=rangeinput]').val('R$ ' + valor);
        });
    
        $(".TipoDePassageiro tr td span[class] span input:checked").parent().parent().addClass('Ativo');
        $(".TipoDeViagem tr td span[class] span input:checked").parent().parent().addClass('Ativo');
        $(".TipoDePassageiro tr td span[class]").click(function(){
            checkbox = $(this).find("input");
            checked = checkbox.attr("checked");
            
            if(checked == true){
                $(this).removeClass('Ativo');
                checkbox.removeAttr('checked');
            }
            else if(checked == false){
                $(this).addClass('Ativo');
                checkbox.attr('checked','true');
            } 
            
        }); 
        $(".TipoDeViagem tr td span[class]").click(function(){
            checkbox = $(this).find("input");
            checked = checkbox.attr("checked");
            
            if(checked == true){
                $(this).removeClass('Ativo');
                checkbox.removeAttr('checked');
            }
            else if(checked == false){
                $(this).addClass('Ativo');
                checkbox.attr('checked','true');
            } 
            
        }); 
        
        
        $(".TipoDePassageiroEn tr td span[class] span input:checked").parent().parent().addClass('Ativo');
        $(".TipoDeViagemEn tr td span[class] span input:checked").parent().parent().addClass('Ativo');
        $(".TipoDePassageiroEn tr td span[class]").click(function(){
            checkbox = $(this).find("input");
            checked = checkbox.attr("checked");
            
            if(checked == true){
                $(this).removeClass('Ativo');
                checkbox.removeAttr('checked');
            }
            else if(checked == false){
                $(this).addClass('Ativo');
                checkbox.attr('checked','true');
            } 
            
        }); 
        $(".TipoDeViagemEn tr td span[class]").click(function(){
            checkbox = $(this).find("input");
            checked = checkbox.attr("checked");
            
            if(checked == true){
                $(this).removeClass('Ativo');
                checkbox.removeAttr('checked');
            }
            else if(checked == false){
                $(this).addClass('Ativo');
                checkbox.attr('checked','true');
            } 
            
        }); 

        $(".TipoDePassageiroEs tr td span[class] span input:checked").parent().parent().addClass('Ativo');
        $(".TipoDeViagemEs tr td span[class] span input:checked").parent().parent().addClass('Ativo');
        $(".TipoDePassageiroEs tr td span[class]").click(function(){
            checkbox = $(this).find("input");
            checked = checkbox.attr("checked");
            
            if(checked == true){
                $(this).removeClass('Ativo');
                checkbox.removeAttr('checked');
            }
            else if(checked == false){
                $(this).addClass('Ativo');
                checkbox.attr('checked','true');
            } 
            
        }); 
        $(".TipoDeViagemEs tr td span[class]").click(function(){
            checkbox = $(this).find("input");
            checked = checkbox.attr("checked");
            
            if(checked == true){
                $(this).removeClass('Ativo');
                checkbox.removeAttr('checked');
            }
            else if(checked == false){
                $(this).addClass('Ativo');
                checkbox.attr('checked','true');
            } 
            
        }); 
        
        $("td.ComoMudar table tr td span[class] input:radio").css('display','none');
		$("td.ComoMudar table tr td span[class] div").css('display','none');
		$("td.ComoMudar table tr td span[class] input:radio[checked]").parent().addClass('Ativo');
		$("td.ComoMudar table tr td span[class]").css('display','block');
		$("td.ComoMudar table tr td span[class]").click(function(){
		    $("td.ComoMudar table tr td span.Ativo").removeClass('Ativo');
		    $("td.ComoMudar table tr td span[class] input:radio").attr('checked', false);
		    $(this).find('input:radio').each(function(){
		        $(this).attr('checked', true);
		        $(this).parent().addClass('Ativo');
		     });    
		   
		});


	if(window.location.pathname.toLowerCase().indexOf('/curiosidades/') > -1){
			$('.DisplayItem').click(function(){
			    var ItemID = $(this).attr('ID');
			    $('.Curiosidades .Conteudo .Itens').each(function(){
			        var ItensREL = $(this).attr('rel');
			        $(this).hide();
			        if(ItemID == ItensREL){
			            $(this).show();
			        }
			    });
			});
			 $('.Listagem ul li').each(function(){
			     var ListItemREL = $(this).attr('rel');    
			     $('.Listagem .Titulo').each(function(){
			        var TitleID = $(this).attr('ID');
			        if(TitleID == ListItemREL){
			           $(this).show(); 
			        }			        
					$('.Alfabeto a').each(function(){
						var AlfabetoREL = $(this).attr('rel');
						if(AlfabetoREL == ListItemREL){
							$(this).attr('href','#'+ListItemREL);
							$(this).removeClass('Disabled'); 
							$(this).addClass('Enabled');
						}
					});
				 });
			});
			$('.Alfabeto a[href*=#]').click(function(){
				
				$('.Alfabeto a').each(function(){
			        $(this).removeClass('Ativo');   
			    });
			    $(this).addClass('Ativo');
			    var $target = $(this.hash);
			    $target = $target.length && $target || $('[name=' + this.hash.slice(1) +']');
			    if ($target.length) {
			        var TargetPosition =($target.position().top) - 20;			        
			        $('.Listagem').animate({scrollTop: TargetPosition}, 'slow');
			        return false;
			    }
			});	
	}

	$('.Passagens .Informacoes .Data').click(function(){
		$(this).find('input').focus();
	}); 
	
	// declara um array
	var sizes2 = [];
	// pega as tuas três divs, e para cada uma delas
	$(".MaiorAltura .BoxComBorda").each(function(){
	 // joga o "height" dela no array
	 sizes2.push($(this).height());
	});
	// pega o valor máximo do array (correspondente a maior altura)
	var max2 = Math.max.apply(null, sizes2);
	
	$('.MaiorAltura .BoxComBorda').css('height',max2);
	
	
	$(".Atendimento .Busca .TextBox").focus(function () {
         $(".Atendimento .Busca .Content").css('display','block');
         if($(this).val().trim() == "O que você procura? Escreva aqui.")
         	$(this).val("");
    });
    
    $(".Atendimento .Busca .TextBox").click(function () {
         if($(".Atendimento .Busca .Content").css('display') != 'block')
         {
         	$(".Atendimento .Busca .Content").css('display','block');
         	if($(this).val().trim() == "O que você procura? Escreva aqui.")
         		$(this).val("");
         }
    });

    $(".Atendimento .Busca .TextBox").blur(function () {
         $(".Atendimento .Busca .Content").css('display','none');
    });
    
    $(".Atendimento .Busca .Content").mouseenter(function(){
    	$(".Atendimento .Busca .TextBox").unbind('blur');
	});

	$(".Atendimento .Busca").mouseleave(function(){
 		$(".Atendimento .Busca .TextBox").blur(function () {
        	$(".Atendimento .Busca .Content").css('display','none');
   	 	}); 	 	
   	 	$(this).mouseenter(function(){
    		$(".Atendimento .Busca .TextBox").unbind('blur');
		});
 	 	$(".Atendimento .Busca .Content").css('display','none');
	});
	
	$(".Atendimento .Busca .Content .Referencia").click(function(){
    	var strTexto = $(this).html().trim();
    	$(".Atendimento .Busca .TextBox").css('color','#5E5E5E');
    	$(".Atendimento .Busca .TextBox").val(strTexto);
    	$(".Atendimento .Busca .Content").css('display','none');
	});   
	
    $("[placeholder]").focus(function() {
	  var input = $(this);
	  if (input.val() == input.attr("placeholder")) {
	    input.val("");
	    input.removeClass("placeholder");
	  }
	}).blur(function() {
	  var input = $(this);
	  if (input.val() == "" || input.val() == input.attr("placeholder")) {
	    input.addClass("placeholder");
	    input.val(input.attr("placeholder"));
	  }
	}).blur();

		 
	$('.Nav .Publico ul').find('li:last').addClass('Ultima');

/*-------------------------------------------------
  	Funcionalidade de abas
  	---------------------------------------------------*/
	$(".Tabs ul.Header").tabs(".Tabs div.Container > div");
 	
  	/*-------------------------------------------------
  	Funcionalidade para "Geração" de titulos dinâmicos
  	---------------------------------------------------*/
	jQuery("p.Titulo").text(jQuery("a.Ativo:first span, a.Ativo:first",jQuery(".Superior,.Publico")).eq(0).text());
	
	/*------------------------------------------------
	  Remove o título da área de atendimentos
	-------------------------------------------------*/
	if($('.Centro h1').html() != null)
	{
		if(($('.Centro h1').html().trim() == 'Atendimento')||($('.Centro h1').html().trim() == 'Resultado da Busca de Atendimento')||($('.Centro h1').html().trim() == 'Customer service')||($('.Centro h1').html().trim() == 'Atención')||($('.Centro h1').html().indexOf('Destinos') > -1))
    		{$('.Centro h1').hide();}
    		
    	var urllocal = window.location.pathname.indexOf('seu-voo');
		if(urllocal == "7"){
		   $('.Centro h1').hide(); 
		};
    }
 	
	/*-------------------------------------------------
	Funcionalidade da seleção de idiomas
	---------------------------------------------------*/  
    var ulPaises = $('div.Paises ul');var divPaises = $('div.Paises');var liItem = $('div.Paises ul li');ulPaises.hide();divPaises.hover(function(){ulPaises.show();},function(){ulPaises.hide();});
    
    /* DropDown de Países */
	$('.Paises').hover(function(){
		$('.Header .Content .Destaque a').attr('enabled', 'false');
	});


	$('.Paises').mouseleave(function(){
		$('.Header .Content .Destaque a').attr('enabled', 'true');
	});

	/*---------------------------------------------------
	Manipulador de Ultimos itens de listas e tabelas
	---------------------------------------------------*/
	$(".Destinos-Abas-Internas table tr td:last-child").css("background", "none");
	$(".Box > .Content > .GridView > tbody > tr > td:last-child").css("border-right", "none");
	$(".Box > .Content > .GridView > tbody > tr:last-child > td").css("border-bottom", "none");
	$(".Festa > .Separador:last-child").css("display", "none");
	$('.GridView td:last').children(".Separador").remove();
	       	
	/*------------------------------------------------------------
	Compartilhe Facebook
	------------------------------------------------------------*/
	var URL_SITE = window.location.href;
	jQuery(".Ferramentas > ul li.Facebook").append('<a href="http://www.facebook.com/sharer.php?u='+URL_SITE+'" target="_blank" title="Facebook"><img alt="Facebook" src="/Util/Imagens/Icones/barra-de-ferramentas-face.jpg" style="BORDER: 0px solid;margin-top: 1px;" /></a>'); 

    /*------------------------------------------------------------
	Navegação de Serviços
	------------------------------------------------------------*/	
    //Esconde o menu e o titulo da sub-home de serviços
    if(window.location.pathname.toLowerCase().indexOf("servicos/paginas/default.aspx" || "servicos/pages/default.aspx" )>-1 )
    {
        $(".Main h1").hide();
        $(".Secundario").hide();        
    }
    //Atribui um blank em um item de MossMenu: Seguros
    if(window.location.pathname.toLowerCase().indexOf("servicos")>-1 )
    {
        $('.Nav .Secundario a:last').attr('target','_blank')      
    }
     /*------------------------------------------------------------
	Agencias
	------------------------------------------------------------	*/
    //Esconde o menu e o titulo da sub-home de serviços
    if(window.location.pathname.toLowerCase().indexOf("/en-us/agencias/Paginas/new-home.aspx" ) > -1 )
    {
        $(".Main h1").hide();     
    }

	/*------------------------------------------------------------
	Destinos
	------------------------------------------------------------*/
	//Quando não conter imagem, retirar a estrutura de cantos arredondados
	$('.Destinos .Imagem').each(function()
	{ 
	    if ($(this).find('img').size() == 0)
	    {
	        $(this).remove();
	    }
	});
	/*------------------------------------------------------------
	Paises
	------------------------------------------------------------*/
	$('.Paises ').mouseenter(function() {
		$('.Paises .Lista').show();
	});
	$('.Paises ').mouseleave(function() {
		$('.Paises .Lista').hide();
	});
	/*------------------------------------------------------------
	Função para Link de Resumo em outros idiomas
	------------------------------------------------------------*/
    var PtBR = window.location.pathname.toLowerCase().toString().indexOf("/pt-br/");
    var EsAr = window.location.pathname.toLowerCase().toString().indexOf("/es-ar/");
    var EsBo = window.location.pathname.toLowerCase().toString().indexOf("/es-bo/");
    var EsCl = window.location.pathname.toLowerCase().toString().indexOf("/es-cl/");
    var EsCo = window.location.pathname.toLowerCase().toString().indexOf("/es-co/");
    var EsPy = window.location.pathname.toLowerCase().toString().indexOf("/es-py/");
    var EsPe = window.location.pathname.toLowerCase().toString().indexOf("/es-pe/");
    var EsDo = window.location.pathname.toLowerCase().toString().indexOf("/es-do/");
    var EsUy = window.location.pathname.toLowerCase().toString().indexOf("/es-uy/");
    var EsVe = window.location.pathname.toLowerCase().toString().indexOf("/es-ve/");
    var EnUS = window.location.pathname.toLowerCase().toString().indexOf("/en-us/");
    if (PtBR > -1) { var CurrentLaguage = "/pt-br"; }
    else if (EsAr > -1) { var CurrentLaguage = "/es-ar"; }
    else if (EsBo > -1) { var CurrentLaguage = "/es-bo"; }
    else if (EsCl > -1) { var CurrentLaguage = "/es-cl"; }
    else if (EsCo > -1) { var CurrentLaguage = "/es-co"; }
    else if (EsPy > -1) { var CurrentLaguage = "/es-py"; }
    else if (EsPe > -1) { var CurrentLaguage = "/es-pe"; }
    else if (EsDo > -1) { var CurrentLaguage = "/es-do"; }
    else if (EsUy > -1) { var CurrentLaguage = "/es-uy"; }
    else if (EsVe > -1) { var CurrentLaguage = "/es-ve"; }
    else if (EnUS > -1) { var CurrentLaguage = "/en-us"; }

    if (PtBR > -1) {
        $('.Lang .es-es').remove();
        $('.Lang .en-us').remove();
        //Mudança nos links do Rodapé
        $('.Footer .Change a').each(function () {
            var hrefinicial = $(this).attr('href');
            var Novohref = CurrentLaguage + hrefinicial;
            $(this).attr({ 'href': Novohref });
        });
        $('.Footer .ChangeSmiles a').each(function () {
            var hrefinicial = $(this).attr('href');
            var Novohref = "/smiles" + CurrentLaguage + hrefinicial;
            $(this).attr({ 'href': Novohref });
        });
        	var urlatual = window.location.pathname.indexOf('sao-paulo-congonhas.aspx');
		if(urlatual == '24'){
		        $('h1.Titulo').replaceWith('<h1 class="Titulo">SÃO PAULO - SP</h1>');
		}
			var urlatual = window.location.pathname.indexOf('sao-paulo-guarulhos.aspx');
		if(urlatual == '24'){
		        $('h1.Titulo').replaceWith('<h1 class="Titulo">SÃO PAULO - SP</h1>');
		}
		$('.Lang .pt-br').css({ 'display': 'block' });
		$('.Nav .Superior ul li.Promocoes').css({ 'display': 'block' });
    }
    if (EsAr > -1 || EsBo > -1 || EsCl > -1 || EsCo > -1 || EsPy > -1 || EsPe > -1 || EsDo > -1 || EsUy > -1 || EsVe > -1) {
        $('.Lang .pt-br').remove();
        $('.Lang .en-us').remove();
        //Mudança nos links do Rodapé
        $('.Footer .Change a').each(function () {
            var hrefinicial = $(this).attr('href');
            var Novohref = CurrentLaguage + hrefinicial;
            $(this).attr({ 'href': Novohref });
        });
        $('.Footer .ChangeSmiles a').each(function () {
            var hrefinicial = $(this).attr('href');
            var Novohref = "/smiles/es-ar" + hrefinicial;
            $(this).attr({ 'href': Novohref });
        });
       		var urlatual = window.location.pathname.indexOf('sao-paulo-congonhas.aspx');
		if(urlatual == '24'){
		        $('h1.Titulo').replaceWith('<h1 class="Titulo">SAN PABLO - SP</h1>');
		}
			var urlatual = window.location.pathname.indexOf('sao-paulo-guarulhos.aspx');
		if(urlatual == '24'){
		        $('h1.Titulo').replaceWith('<h1 class="Titulo">SAN PABLO - SP</h1>');
		}
		
		$('.Nav .Superior ul li.Promocoes').remove(); 
		$('.Lang .es-es').css({ 'display': 'block' });
    	//Ajustar links para todas espanhois
    	var link_hoteis = $('li.Hoteis.es-ar a');
    	if (link_hoteis.length){
    		
		    if (EsBo > -1) {  link_hoteis.attr('href','http://voegolbo.e-travelsolution.com/'); }
		    else if (EsCl > -1) { link_hoteis.attr('href','http://voegolcl.e-travelsolution.com/') }
		    else if (EsCo > -1) { link_hoteis.attr('href','http://voegolco.e-travelsolution.com/') }
		    else if (EsPy > -1) { link_hoteis.attr('href','http://voegolpy.e-travelsolution.com/') }
		    //else if (EsPe > -1) { link_hoteis.attr('href','http://partners.clickhoteles.com.bo/?idcliente=366705') }
		    else if (EsDo > -1) { link_hoteis.attr('href','http://voegoldo.e-travelsolution.com/') }
		    else if (EsUy > -1) { link_hoteis.attr('href','http://voegoluy.e-travelsolution.com/') }
		    else if (EsVe > -1) { link_hoteis.attr('href','http://voegolve.e-travelsolution.com/') }
		    
    		$('li.Hoteis.es-ar').show();
		}

    }
    if (EnUS > -1) {
        $('.Lang .pt-br').remove();
        $('.Lang .es-es').remove();
        //Mudança nos links do Rodapé
        $('.Footer .Change a').each(function () {
            var hrefinicial = $(this).attr('href');
            var Novohref = CurrentLaguage + hrefinicial;
            $(this).attr({ 'href': Novohref });
        });
        $('.Footer .ChangeSmiles a').each(function () {
            var hrefinicial = $(this).attr('href');
            var Novohref = "/smiles" + CurrentLaguage + hrefinicial;
            $(this).attr({ 'href': Novohref });
        });
        	var urlatual = window.location.pathname.indexOf('sao-paulo-congonhas.aspx');
		if(urlatual == '24'){
		        $('h1.Titulo').replaceWith('<h1 class="Titulo">SÃO PAULO - SP</h1>');
		}
			var urlatual = window.location.pathname.indexOf('sao-paulo-guarulhos.aspx');
		if(urlatual == '24'){
		        $('h1.Titulo').replaceWith('<h1 class="Titulo">SÃO PAULO - SP</h1>');
		}
        $('.Lang .en-us').css({ 'display': 'block' });
        $('.Nav .Superior ul li.Promocoes').css({ 'display': 'block' });
        
    }
    
});

/*------------------------------------------------------------------------------------------------------
  Função para estilização de backgrounds 
------------------------------------------------------------------------------------------------------*/
function SetBackgroundProperties(idDefinicaoFundo, container, posicaoX, posicaoY, imageUrl, backgroundColor, repeatMode)
{   
    if(idDefinicaoFundo != 0)
    {
        var elemento;
        
        //Tenta recuperar o elemento passado por parâmetro
        elemento = $(container);
        
        //Se não existe o elemento
        if(elemento.size() == 0)
            //Tenta recuperá-lo como classe
            elemento = $("." + container);
        
        //Se não encontrou elemento
        if(elemento.size() == 0) 
            //Tenta recuperá-lo como Id
            elemento = $("#" + container);
           
        //Se existe o elemento   
        if(elemento.size() > 0)     
        { 
            //Se 'backgroundColor' for vazio
            if(backgroundColor == "")
            
                //Seta com a cor branca
                backgroundColor = "#fff";
            
            //Seta as propriedades CSS do elemento passado como parâmetro
            elemento.css('background-image', 'url(' + imageUrl + ')');
            elemento.css('background-position', posicaoX + ' ' + posicaoY);
            elemento.css('background-repeat', repeatMode);
            elemento.css('background-color', backgroundColor);
        }
    }
}

/*---------------------------
  Busca do Site
---------------------------*/
function Buscar()
{
	idioma = GetLanguage();
	id = $('input[id*=txtBusca]').attr('id');
	window.location= "/"+idioma+'/busca/Paginas/resultado-da-busca.aspx?PC=' + document.getElementById(id).value;
}
  
function tecla_enter(e) 
{ 
    var codigo = e.keyCode;
    if (codigo == 13)
    { 
    	Buscar();
    }
} 


/*------------------------------------------------------------
							History Go 
------------------------------------------------------------*/
$(document).ready(function()
{
	$("#btnVoltar").click(function()
	{
		history.go(-1);
	});
	
	
	
	$('.Superior').find('li > a > span').each(function(){
    	$(this).css('white-space','nowrap');
	    var largura = $(this).width();
	    if(largura > 80){
	      $(this).parent().parent().addClass('ItemMenuGrande');
	    }
	});	
});



/*------------------------------------------------------------
							Pré-Home
------------------------------------------------------------*/

$(document).ready(function()
{
	$(function(){
	        $('.LandPage .PaisesPreHome').hover(function(){
	            $('.LandPage .PaisesPreHome table').fadeIn();
	        }, function(){
	            $('.LandPage .PaisesPreHome table').hide();
	        });
	    
	});
});

/*------------------------------------------------------------
    Máscaras Javascript - date
------------------------------------------------------------*/
$(document).ready(function()
{
    $("input:text[alt='date']").change(function()
    {
	    $("input:text").setMask();
    });
});

/*-----------------------------------------------------------
		Function TrackOmni
-----------------------------------------------------------*/
function trackOmni(pName,event) {
	s.pageName = pName;
	s.channel  = 'VoeGOL';
	s.t();
}

/*-----------------------------------------------------------
		Function Troca cultura na URL de check-in
-----------------------------------------------------------*/
$(document).ready(function(){
	$('#ItemCultura').each(function(){
		var idioma = window.location.pathname.split('/',2).toString().substring("1");
		hrefatual = $(this).attr('href');
		hreffinal = hrefatual + '?culture=' + idioma
		$(this).attr('href',hreffinal);
	});
});


