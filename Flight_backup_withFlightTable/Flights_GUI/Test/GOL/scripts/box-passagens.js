$(document).ready(function () { 
    /*-------------------------------------------------------------
	  Esconde e mostra o box de compra de passagens em todo o site
	---------------------------------------------------------------*/
	try
	{
		//Verifica se a pagina é a home do site em pt-br
		if(window.location.href.indexOf("/" + GetLanguage() + "/Paginas/default.aspx") != -1)
		{
	    	$(".Superior a:first").addClass("Ativo");
		}
		else
			$(".Superior a:first").removeClass("Ativo");
	}
	catch(ex){}
	
	//Adiciona javascript:void(0); no bot?o Passagens no menu
	$(".Superior a:first").attr("href", "javascript:void(0)");
	
	//Adiciona evento quando o bot?o passagens for clicado
	$(".Superior a:first").click(function(){
		//verifica se o box esta visivel
	    if($(".Content .Abas").is(":visible"))
	    {
	    	//Esconde o box de passagens
	        $(".Content .Abas").slideUp(250);
	        //remove classe Ativo
	        $(".Superior a:first").removeClass("Ativo");
	    }
	    else
	    {
		    //Esconde o box de passagens
	        $(".Content .Abas").slideDown(250);
	        //Adiciona classe ativo
	        $(".Superior a:first").addClass("Ativo");
	    } 
	});
	
	
 });
 
 
/*
 * =============================================================
 * Aqui come?am as fun??es do formulário de passagens e checkin
 * =============================================================
 */

/*
 * Fun??o responsável por setar a máscara dos campos de texto
 */
function setMask()
{
    (function($){ 
        $(function(){ 
            $('input:text').setMask();
        });
    })(jQuery);
}

/*
 * Seta as funcionalidades do calendário
 */
 function RecuperaIdiomaCalendario()
{
    var strCaminho = window.location.pathname;
    strCaminho = strCaminho.substr(1,2);    
    
    return strCaminho;
}

function setCalendar()
{
    //Seta as configura??es default do calendário
	//Seta as configura??es default do calendário
    if(RecuperaIdiomaCalendario() == "en")
    {
        $.datepicker.setDefaults
        (
            {
                closeText: 'Close',
                prevText: '&#x3c;Previous',
                nextText: 'Next&#x3e;',
                currentText: 'Today',
                monthNames: ['January','February','March','April','May','June', 'July','August','September','October','November','December'],
                monthNamesShort: ['Jan','Feb','Mar','Apr','May','Jun', 'Jul','Aug','Sep','Oct','Nov','Dec'],
                dayNames: ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'],
                dayNamesShort: ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'],
                dayNamesMin: ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'],
                weekHeader: 'We',
                dateFormat: 'mmddyy',
                firstDay: 0,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: '',
                showButtonPanel: true,
                showAnim: 'slide',
                duration: 'fast',
                numberOfMonths: 2,
                showOptions: {direction: 'up' }
            }
        );
    }
    else if(RecuperaIdiomaCalendario() == "es")
    {
        $.datepicker.setDefaults
        (
            {
                closeText: 'Cerca',
                prevText: '&#x3c;Anterior',
                nextText: 'Cerca&#x3e;',
                currentText: 'Hoy',
                monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                monthNamesShort: ['Jan','Feb','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dic'],
                dayNames: ['Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado'],
                dayNamesShort: ['Dom','Lun','Mar','Mie','Jue','Vie','Sab'],
                dayNamesMin: ['Dom','Lun','Mar','Mie','Jue','Vie','Sab'],
                weekHeader: 'Sm',
                dateFormat: 'ddmmyy',
                firstDay: 0,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: '',
                showButtonPanel: true,
                showAnim: 'slide',
                duration: 'fast',
                numberOfMonths: 2,
                showOptions: {direction: 'up' }
            }
        );
    }
    else
    {
        $.datepicker.setDefaults
        (
            {
                closeText: 'Fechar',
                prevText: '&#x3c;Anterior',
                nextText: 'Cercano&#x3e;',
                currentText: 'Hoje',
                monthNames: ['Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho', 'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun', 'Jul','Ago','Set','Out','Nov','Dez'],
                dayNames: ['Domingo','Segunda-feira','Ter&ccedil;a-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sabado'],
                dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
                dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
                weekHeader: 'Sm',
                dateFormat: 'ddmmyy',
                firstDay: 0,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: '',
                showButtonPanel: true,
                showAnim: 'slide',
                duration: 'fast',
                numberOfMonths: 2,
                showOptions: {direction: 'up' }
            }
        );
    }

    
    //Cria a variável que determina a data mínima do calendário do dia da ida
    dataMinimaInicio = new Date();
    
    /*$("input[id*='txtDiaDaIda']").datepicker({showOn: "button",buttonImage: "/Util/Imagens/Icones/calendario.png",buttonImageOnly: true});
    $("input[id*='txtDiaDaVolta']").datepicker({showOn: "button",buttonImage: "/Util/Imagens/Icones/calendario.png",buttonImageOnly: true});
    $("input[id*='txtData']").datepicker({showOn: "button",buttonImage: "/Util/Imagens/Icones/calendario.png",buttonImageOnly: true});*/
   
        
    //Coloca o calendário no campo de texto do dia da ida
    $("input[id*='txtDiaDaIda']").datepicker("option",{
        
        minDate: dataMinimaInicio,
        
        onSelect:function(e)
        {        
            //Remove o último calendário e insere um novo com a data mínima selecionada no dia da ida
            $("input[id*='txtDiaDaVolta']").datepicker('destroy');
            
            $("input[id*='txtDiaDaVolta']").datepicker({minDate : e}); 
            
            
            $('input:text[rel="date"]').setMask();       												
        }
    });
    
    if($("input[id*='txtDiaDaIda']").val() != "")
    {
        //Coloca o calendário no campo de texto do dia da ida
        $("input[id*='txtDiaDaVolta']").datepicker("option",{    
            minDate: $("input[id*='txtDiaDaIda']").val()
        });
        
        $('input:text[rel="date"]').setMask();
    }
    else
    {
        $("input[id*='txtDiaDaVolta']").datepicker("destroy");    
    }    
}

/*
 * Seta as funcionalidades do SelectBox
 */
function setSelectBox()
{
   	$('.Abas .Passagens .DropDownList2, .Abas .CheckIn .DropDownList2').selectbox({debug: true, inputClass : "selectbox2", containerClass : "selectbox-wrapper-2"});  
   
   	$(function() {
		$('.Abas  select[id*=_ddlDestino]').combobox();
		$('.Abas  select[id*=_ddlOrigem]').combobox();
		$('.Abas  select[id*=_ddlDeOndeParteSeuVoo]').combobox();
		$('.Abas  select[id*=_ddlDeOndeTrecho2]').combobox();
		$('.Abas  select[id*=_ddlParaOndeTrecho2]').combobox();
		$('.Abas  select[id*=_ddlCheckinOrigem]').combobox();
		$('.Abas  select[id*=_ddlCheckinDestino]').combobox();
	});
	
   
   	DefineDropDownPassagens();
}




/*
 * Fun??o responsável por remover os select box. Utilizado antes de chamar o plugin novamente, evitando que o plugin seja adicionado duas vezes
 * em um mesmo elemento
 */
function removeSelectBox()
{
    if($('.selectbox') != null)
    {
        $('.selectbox[id*=_input]').remove();
        $('.selectbox').next('div[id*=_container]').remove();
    }
    
    if($('.selectbox2') != null)
    {
        $('.selectbox2[id*=_input]').remove();
        $('.selectbox2').next('div[id*=_container]').remove();
    }
        
}

/*
 * Seta as funcionalidades do ColorBox
 */
function setColorBox()
{  
      if ($("div[id*='vsCompreSuaPassgem']").length > 0)
      {
            $("div[id*='vsCompreSuaPassgem']").hide();  
            if($("div[id*='vsCompreSuaPassgem'] > ul").length > 0)
                $.colorbox({href:"div[id*='vsCompreSuaPassgem'] > ul", open:true, inline:true});
     }   
     
          //Color Box do formulário de checkin com código
     if ($("div[id*='vsFormularioComCodigo']").length > 0)
      {
            $("div[id*='vsFormularioComCodigo']").hide();  
            if($("div[id*='vsFormularioComCodigo'] > ul").length > 0)
                $.colorbox({href:"div[id*='vsFormularioComCodigo'] > ul", open:true, inline:true});
     }
     
     //Color Box do formulário de checkin SEM código
     if ($("div[id*='vsFormularioComCodigo']").length > 0)
     {
            $("div[id*='vsFormularioSemCodigo']").hide();  
            if($("div[id*='vsFormularioSemCodigo'] > ul").length > 0)
                $.colorbox({href:"div[id*='vsFormularioSemCodigo'] > ul", open:true, inline:true});
     }  
}




/*
 * Fun??o responsável por exibir os campos do formulário de chekin SEM CóDIGO
 */
function ShowCheckinComCodigo()
{
	$('[id*=pnlFormularioSemCodigo]').hide();
	$('[id*=pnlFormularioComCodigo]').show();
	$('[id*=lbtnIniciarComCodigo]').show();
	$('[id*=lbtnIniciarSemCodigo]').hide();
}

/*
 * Fun??o responsável por exibir os campos do formulário de chekin COM CóDIGO
 */
function ShowCheckinSemCodigo()
{
	$('[id*=pnlFormularioSemCodigo]').show();
	$('[id*=pnlFormularioComCodigo]').hide();
	$('[id*=lbtnIniciarComCodigo]').hide();
	$('[id*=lbtnIniciarSemCodigo]').show();
}

/*
 * Fun??o responsável por exibir os campos só de ida do formulário de passagens
 */
function ShowSoIda()
{
	$('[id*=txtDiaDaVolta]').hide();
	$('[id*=lblDiaDaVolta]').hide();
	$('[id*=pnlVariosTrechos]').hide();
	$('[id*=lblTrechoUm]').hide();
	$('[id*=lblTrechoDois]').hide();
	
	var id = $("input[id*='txtDiaDaIda']").attr('id');
    var textbox = document.getElementById(id);
    textbox.value = '';
}


/*
 * Fun??o responsável por exibir os campos de vários trechos do formulário de passagens
 */
function ShowVariosTrechos()
{
	$('[id*=txtDiaDaVolta]').show();
	$('[id*=lblDiaDaVolta]').show();
	$('[id*=pnlVariosTrechos]').show();
	$('[id*=lblTrechoUm]').show();
	$('[id*=lblTrechoDois]').show();
	
	var id = $("input[id*='txtDiaDaIda']").attr('id');
    var textbox = document.getElementById(id);
    textbox.value = '';

    var id2 = $("input[id*='txtDiaDaVolta']").attr('id');
    var textbox2 = document.getElementById(id2);
    textbox2.value = '';
}

/*
 * Fun??o responsável por exibir os campos de ida e volta do formulário de passagens
 */
function ShowIdaEVolta()
{
	$('[id*=txtDiaDaVolta]').show();
	$('[id*=lblDiaDaVolta]').show();
	$('[id*=pnlVariosTrechos]').hide();
	$('[id*=lblTrechoUm]').hide();
	$('[id*=lblTrechoDois]').hide();
	
	var id = $("input[id*='txtDiaDaIda']").attr('id');
    var textbox = document.getElementById(id);
    textbox.value = '';

    var id2 = $("input[id*='txtDiaDaVolta']").attr('id');
    var textbox2 = document.getElementById(id2);
    textbox2.value = '';
}

/*
 * Fun??o responsável por adicionar o evento que limpa o campo de volta se o campo de IDA receber o focus
 */
function validaIdaEVolta()
{
    $('input[id*=txtDiaDaIda]').live('click', function(){
        $('input[id*=txtDiaDaVolta]').val('');
    });
}


/*
 * Fun??o responsável por exibir o bot?o de formulário de chekin COM CóDIGO
 */
function ShowButtonCheckinComCodigo()
{
    $("a[id*=lbtnIniciarComCodigo]").show();
    $("a[id*=lbtnIniciarSemCodigo]").hide();
}

/*
 * Fun??o responsável por exibir o bot?o de formulário de chekin SEM CóDIGO
 */
function ShowButtonCheckinSemCodigo()
{
    $("a[id*=lbtnIniciarComCodigo]").hide();
    $("a[id*=lbtnIniciarSemCodigo]").show();
}

/*
 * Fun??o responsável por exibir o formulário de checkin e esconder o formulário de passagens
 */
function ShowCheckin()
{
    $(".CheckIn").show();
    $(".Abas .Passagens").hide();
    $("div[id*=pnlVariosTrechos]").hide();
    
    VerificaFormularioCheckin();
}

/*
 * Fun??o responsável por exibir o formulário de passagens e esconder o formulário de checkin
 */
function ShowPassagens()
{
    $(".CheckIn").hide();
    $(".Passagens").show();      
}

/*
 * Fun??o responsável por verificar o formulário de checkin
 */
function VerificaFormularioCheckin()
{   
    if (isFormularioSemCodigoVisible == 'True')
        ShowButtonCheckinSemCodigo();
    else
        ShowButtonCheckinComCodigo();
}

/*
 * Seta o comportamento das abas de Checkin e Compre sua passagem
 */
function setTabsComportament(isCheckinVisible)
{
   
    if(isCheckinVisible == "True")
    {
        ShowCheckin();  
        VerificaFormularioCheckin()
    }
    else   
    {
        ShowPassagens();
        VerificaFormularioCheckin()
    }
    
    $('a[id*=hypCheckin]').click(function()
    {    
       
    
        ShowCheckin();
        VerificaFormularioCheckin()
    });

    $('a[id*=hypCompreSuaPassagem2]').click(function()
    {
        ShowPassagens();
        VerificaFormularioCheckin()      
    });
}

/*
 * Fun??o utilizada por exibir o formulário de chekin com código ou sem código
 */
function ShowFormularioChekinComOuSemCodigo()
{
    if (isFormularioSemCodigoVisible == 'True') 
    {   
        ShowCheckinSemCodigo();
        $('[id*=rbtnSemCodigoLocalizador]').attr('checked', 'checked');
    }
    else 
    {
        ShowCheckinComCodigo();
        $('[id*=rbtnComCodigoLocalizador]').attr('checked', 'checked');
    }
}

/*
 * Fun??o responsável por definir as funcionalidades do formulário de checkin e de vários trechos
 */
function DefineFormularioCheckinETrechos()
{
    ShowFormularioChekinComOuSemCodigo();

    $('[id*=rbtnComCodigoLocalizador]').live('click', function() {
        ShowCheckinComCodigo();
    });

    $('[id*=rbtnSemCodigoLocalizador]').live('click', function() {
        ShowCheckinSemCodigo();

    });
    
    var radioIdaEVolta = $('[id*=rbtnlIdaEVolta] input:eq(0)');
    var radioSoIda = $('[id*=rbtnlIdaEVolta] input:eq(1)');
    var radioVariosTrechos = $('[id*=rbtnlIdaEVolta] input:eq(2)');
    
    
    if(radioIdaEVolta.attr("checked"))
        ShowIdaEVolta();  
    
    if(radioSoIda.attr("checked"))
        ShowSoIda();  
    
    if(radioVariosTrechos.attr("checked"))
        ShowVariosTrechos();  
          
    
    radioIdaEVolta.live('click', function(){
        ShowIdaEVolta();
    });
    
       
    radioSoIda.live('click', function(){
        ShowSoIda();
    });
    
    radioVariosTrechos.live('click', function(){
        ShowVariosTrechos();
    });
}

/*
 * Fun??o utilizada por setar as configura??es gerais
 */
function SetGeneralSettings()
{    
	setColorBox();
	setCalendar();
	setMask();
	setSelectBox();
}

/*
 * Fun??o responsável por exibir o formulário conforme o parametro
 */
function DefineFormVisible(isFormVisible)
{
	if(window.location.href.toLowerCase().indexOf('/' + GetLanguage() + '/paginas/default.aspx') != -1 || isFormVisible == 'True')
	{
        $('#Abas').show();
    }
}

function GetLanguage()
{
	var regex = new RegExp('^[a-zA-Z]{2}-[a-zA-Z]{2}$');
	
	var language = window.location.href.split('/')[3];
	
	if(regex.exec(language))
	    return language;
	return ''; 
}


/*
 * Fun??o responsável por preparar o processo do post através do AJAX
 */
function InitPost()
{
    //Recupera o conteúdo do formulário como um array serializado
    form = $("#aspnetForm").serializeArray();

    tipoFormulario = 1;
        
    //Se a data da volta n?o estiver visível o tipo de formulario é 1
    if (!$('[id*=txtDiaDaVolta]').is(':visible'))
        tipoFormulario = 2;

    //Se o panel de varios trechos estiver visível, o tipo de formulario é 2
    if ($('[id*=pnlVariosTrechos]').is(':visible'))
        tipoFormulario = 3;

    $(".Abas").css('opacity',0.4);
    var loader = jQuery('<div id="loader"><img src="/util/imagens/icones/loading.gif" alt="loading..." /></div>').css({position: "relative",float:"left", top: -($('.Abas').height() / 2), left: $('.Abas').width() / 2}).appendTo(".Abas");
    loader.show();
}

/*
 * Fun??o responsável por definir o comportamento do formulário após o POST por AJAX
 */
function SetForm(data, AllFormVisible)
{
	SetGeneralSettings();
	
	setTabsComportament("False");
	ShowFormularioChekinComOuSemCodigo();
	$('#Abas').show();
	
	//Seta o valor da VIEWSTATE e da EVENTVALIDATION com o valor postado
	$("#__VIEWSTATE").val($("#__VIEWSTATE", data).val());
	$("#__EVENTVALIDATION").val($("#__EVENTVALIDATION", data).val());
}


/*
 * Fun??o responsável por atualizar o conteúdo do formulário de passagens 
 */
function GetPassagens(data)
{
    var docPassagens = $(".Abas", data);
    $(".Abas").html(docPassagens.html());
    $(".Abas").removeAttr('style');           
}

/* 
 * Fun??o responsável por inicializar o comportamento do formulário ao carregar a página
 */
function InitFormPassagens(AllFormVisible, FormularioSemCodigoVisible, CheckinVisible)
{    
	isFormularioSemCodigoVisible = FormularioSemCodigoVisible;
    SetGeneralSettings();
    setTabsComportament(CheckinVisible);
    validaIdaEVolta();
    DefineFormularioCheckinETrechos();
    DefineFormVisible(AllFormVisible);
}

/*
 * Fun??o responsável por adicionar o evento de click no bot?o de 'comprar' do formulário de passagens, e realizar o post por AJAX
 */
function FormAjaxRequest(AllFormVisible)
{
    $('[id*=btnComprar]').live('click', function() {

        InitPost();

        $.post('?Enviar=1&TipoFormulario=' + tipoFormulario, form, function(data) {
            
            GetPassagens(data);
            TrataConteudo(data);
            SetForm(data,AllFormVisible);
    
        }, 'html');
         
        return false;
    });
}
/*
 * =============================================================
 * Aqui terminam as fun??es do formulário de passagens e checkin
 * =============================================================
 */
 
 /*
 * Fun??o utilizada para definir o comportamento e ordena??o do DropDown de cidades do formulário de passagens
 */
function DefineDropDownPassagens()
{			
	var divPluginDropDown = $('.ui-autocomplete');
	
	divPluginDropDown.each(function(){
    
    	var contador = 1;
    	var ul = $('<ul class="UlPlugin"></ul>');
    	var div = $('<div></div>');
    	var divAtual = $(this);    
	
    	div.append($('ul', divAtual));
    	$('ul', divAtual).remove();
		
    	$('li', div).each(function(){
			ul.append($(this));
			$(this).css('float', 'none');	
    	    if(contador % 12 == 0)
			{
			    divAtual.append(ul);
			    ul = $('<ul class="UlPlugin"></ul>');
			}
			contador ++;
    	});
	});

	$('.UlPlugin').css('float', 'left');

}

function SetColorBoxRegulamentoCheckIn()
{
	var containerRegulamento = $('.ContainerRegulamentoCheckin');
	var linkDocumentacaoAceita = $('.DocumentacaoAceita');
	containerRegulamento.show();	
	
	linkDocumentacaoAceita.attr('href', '/' + GetLanguage() + '/viaje-sem-duvidas/antes-de-embarcar/paginas/default.aspx');
	linkDocumentacaoAceita.attr('target', '_blank');
	
	$.colorbox({href:containerRegulamento, width:1000, debug:true, inline:true });
}

$(function(){
	$('.LinkRegulamentoCheckIn').click(function(){
		SetColorBoxRegulamentoCheckIn();
	});
	
	$('#cboxClose').click(function(){
		$('.ContainerRegulamentoCheckin').hide();
	});
		
	$(document).bind('cbox_closed', function(){
		$('.ContainerRegulamentoCheckin').hide();
	});
});

/*
 * Fun??o responsável por retornar o texto 'Selecione' do DropDown de acordo com o idioma
 */
function DefineTextoSelecioneByLanguage()
{
	switch(GetLanguage())
	{
		case 'pt-br':
			return 'Selecione';
		case 'en-us':
			return 'Select';
		default :
			return 'Selecione';
	}
}

/*
 * Define a listagem do DropDown de autocomplete em colunas
 */
function DefineListagemDoDropDownEmColunas()
{
	//Recupera todos os container utilizados pelo plugin de autocomplete
	var containerPluginDropDown = $('.ui-autocomplete');
	
	//Percorre todos os container
	containerPluginDropDown.each(function(){

		var contador = 1;
		var itensPorColuna = 14;
		var ul = $('<ul class="UlPlugin"></ul>');
		var container = $('<div></div>');
		var containerAtual = $(this);
	  	
	  	//Recupera a quantidade de itens do container atual
	  	var QtdeItemsContainerAtual = $('li', containerAtual).size();
	  	
		//Esvazia o container atual e preenche o container
	    $('li', containerAtual).each(function(){
	    	var text = $(this).children().text();
	    	var matcher = new RegExp(
					"(?![^&;]+;)(?!<[^<>]*)(" +
						$.ui.autocomplete.escapeRegex("todos os aeroportos") +
					")(?![^<>]*>)(?![^&;]+;)", "gi"
				);
			if (matcher.test(text))
			{
				$(this).children().html("<strong style='font-size: 11px;'>"+text+"</strong>");
			}
			container.append($(this));
	    });
	  
	    //Cria um LI no container atual
		containerAtual.append($('<li></li>'));    

	   //Percorre todos os LIs do novo container
	   $('li', container).each(function(){
	      
			//Adiciona no UL o li corrente
	    	ul.append($(this));

		    //Retira a flutua??o do LI
	    	$(this).css('float', 'none');

			if(QtdeItemsContainerAtual < itensPorColuna)
			{
				if(contador == QtdeItemsContainerAtual)
				{	
	    	    	$(' > li', containerAtual).append(ul);
				}
			}
			else
			{
				if(contador % itensPorColuna == 0)  
		    	{
		    	 	ul = $('<ul class="UlPlugin"></ul>'); 
		    	    $(' > li', containerAtual).append(ul); 
		    	}
		    	else
		    	{
		    		$(' > li', containerAtual).append(ul);
		    	}
			}
			
    		//Incrementa o contador de itens
    		contador ++;
		});	
				
	});	

	$('.ui-autocomplete').css('width', 'auto');
	$('.ui-autocomplete > li').css({'min-width':'900px'});		
	$('.UlPlugin li').attr('style', 'width:150px;');
	$('.UlPlugin').css({'float':'left'});	
	$('.ui-corner-all').removeClass("ui-corner-all");
	$('.ui-autocomplete > li > .UlPlugin:odd').css({'background':'#ffffff'});
	$('.ui-autocomplete > li > .UlPlugin:even').css({'background':'#ffffff'});		
	
		
	// declara um array
	var sizes = [];
	// pega as tuas três divs, e para cada uma delas
	$(".UlPlugin").each(function(){
	 // joga o "height" dela no array
	 sizes.push($(this).height());
	});
	// pega o valor máximo do array (correspondente a maior altura)
	var max = Math.max.apply(null, sizes);
	
	$('.UlPlugin').css('height',max);

}

/*
Auto-Complete
*/

(function( $ ) {
	$.widget( "ui.combobox", {
		_create: function() {
			var self = this,
				select = this.element.hide(),
				selected = select.children( ":selected" ),
				value = selected.val() ? selected.text() : DefineTextoSelecioneByLanguage();
					
			//Campo para digitar		
			
			var accentMap = {
			    "À": "A", "Á": "A", "Ä": "A", "Â": "A", "Ã": "A", 
				"È": "E", "É": "E", "Ë": "E", "Ê": "E",
				"Ì": "I", "Í": "I", "Ï": "I", "Î": "I",
				"Ò": "O", "Ó": "O", "Ö": "O", "Ô": "O", "Õ": "O",
				"Ù": "U", "Ú": "U", "Ü": "U", "Û": "U", "Ç": "C"
			};
			var normalize = function( term ) {
			    var ret = "";
			    for ( var i = 0; i < term.length; i++ ) {
			        ret += accentMap[ term.charAt(i) ] || term.charAt(i);
			    }
			    return ret;
			};
			var input = this.input = $( "<input>" )
				
				//Classe personalizada
				.addClass('selectbox')
				.insertAfter( select )
				.val( value )
				
				//Evento de click para abrir o conteúdo
				.click(function() {
					input.val('');
					// close if already visible
					if ( input.autocomplete( "widget" ).is( ":visible" ) ) {
						input.autocomplete( "close" );
						input.val(DefineTextoSelecioneByLanguage());

						return;
					}
					
					//Consulta todos os registros
					input.autocomplete( "search", "" );
					input.focus();
				})
				//Aplica o auto-complete no campo de texto
				.autocomplete({
					delay: 0,
					minLength: 0,
					source: function( request, response ) {
						var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
						response( select.children( "option" ).map(function() {
							var text = $( this ).text();
							if ( this.value && ( !request.term || matcher.test(text) || matcher.test(normalize(text)) ) )
							{
								
								
									
								return {
									label: text.replace(
										new RegExp(
											"(?![^&;]+;)(?!<[^<>]*)(" +
												$.ui.autocomplete.escapeRegex(request.term) +
											")(?![^<>]*>)(?![^&;]+;)", "gi"
										), "<strong>$1</strong>" ),
									value: text,
									option: this
								};
							}
						}) );
					},
					select: function( event, ui ) {
						
						ui.item.option.selected = true;
						self._trigger( "selected", event, {
							item: ui.item.option
						});
					},
					change: function( event, ui ) {				
						
						if ( !ui.item ) {
							var matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex( $(this).val() ) + "$", "i" ),
								valid = false;
							select.children( "option" ).each(function() {
							
								
							
								if ( $( this ).text().match( matcher ) ) {
									this.selected = valid = true;
									return false;
								}
							});
							if ( !valid ) {							
								
								// remove invalid value, as it didn't match anything
								$( this ).val( "" );
								select.val( "" );
								input.data( "autocomplete" ).term = "";
								return false;
							}
						}
					},
					open: function( event , ui ){
						DefineListagemDoDropDownEmColunas();					
					},					
					close: function( event, ui )
					{
						if(input.val() == '')
							input.val(DefineTextoSelecioneByLanguage())
					}					
				})
				.addClass( "ui-widget ui-widget-content ui-corner-left" );
			input.data( "autocomplete" )._renderItem = function( ul, item ) {
				
				
					
				return $( "<li></li>" )
					.data( "item.autocomplete", item )
					.append( "<a>" + item.label + "</a>" )
					.appendTo( ul );
			};
			/*
			//Alternativa para usar bot?o
			
			this.button = $( "<button type='button'>&nbsp;</button>" )
				.attr( "tabIndex", -1 )
				.attr( "title", "Show All Items" )
				.insertAfter( input )
				.button({
					icons: {
						primary: "ui-icon-triangle-1-s"
					},
					text: false
				})
				.removeClass( "ui-corner-all" )
				.addClass( "ui-corner-right ui-button-icon" )
				.click(function() {
					// close if already visible
					if ( input.autocomplete( "widget" ).is( ":visible" ) ) {
						input.autocomplete( "close" );
						return;
					}
					// pass empty string as value to search for, displaying all results
					input.autocomplete( "search", "" );
					input.focus();
				});*/
		},
		destroy: function() {
			this.input.remove();
			this.button.remove();
			this.element.show();
			$.Widget.prototype.destroy.call( this );
		}
	});
})( jQuery );

/* área de passagens 
function LoadDropDown(arrCidades,container){
	for(i = 0 ;i < arrCidades.length;i++){
		cidade = jQuery(arrCidades[i]);
		value = jQuery("id:first",cidade).text();
		text = jQuery("nome:first",cidade).text();
		jQuery(container).append("<option value='"+value+"'>"+text+"</option>");
	}   
}

$(document).ready(function()
{
	jQuery.get("/passagens.axd",function(data){
		window.cidades = jQuery("cidades>cidade",data);
		LoadDropDown(cidades,jQuery("select[id*='ddlOrigem']"));
		LoadDropDown(cidades,jQuery("select[id*='ddlDeOndeTrecho2']"));
		LoadDropDown(cidades,jQuery("select[id*='ddlCheckinOrigem']"));
	},'xml');
});*/

$(document).ready(function(){
/*---------------------------------------------------
	DHTML da Home
/*---------------------------------------------------*/
    abrirDhtml();

   $(".Passagens input[rel*='date']").datepicker();
});

/*----------------------------------
	FUN  ES PARA EXIBI  O DO DHTML
----------------------------------*/
function fecharDHTML()
{
	$(".boxDhtml").hide();
}

function abrirDhtml()
{
	$(".boxDhtml").show();
     
    setTimeout('fecharDHTML()',12000);
}


