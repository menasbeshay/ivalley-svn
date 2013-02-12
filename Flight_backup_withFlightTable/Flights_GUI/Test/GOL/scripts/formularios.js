$(document).ready(function(){



	if(window.location.pathname.toLowerCase().indexOf('/empresas/') > -1){
		$('a[id*="hypCadastrarNovoAgente"]').attr("title","Cadastrar novo usuário").html("Cadastrar novo usuário")
		$('a[id*="hypCadastrarNovaAgencia"]').attr("title","Cadastrar nova empresa").html("Cadastrar nova empresa")
	}

	/*------------------------------------------------------------
	Envie para um amigo
	------------------------------------------------------------*/
	if($("h1").text().trim() != 'Regulamento Geral')
	{
		$("a[href*='/envie-para-um-amigo/paginas/default.aspx']").click(function()
			{
				var title =  $("h1:last").text().trim();
				window.location.href = "/" + RecuperaIdioma() + "/envie-para-um-amigo/paginas/default.aspx?Title="+encodeURI(title)+"&ContentURL="+window.location;
				return false;
		});
	}
	else
	{
		$("a[href*='/envie-para-um-amigo/paginas/default.aspx']").click(function()
		{
			var title =  $(".Titulo").text().trim();
			window.location.href = "/" + RecuperaIdioma() + "/envie-para-um-amigo/paginas/default.aspx?Title="+encodeURI(title)+"&ContentURL="+window.location;
			return false;
		});
	}
	
	$("a[href*='/Noticias.pt-br.rss.axd']").attr('href',"/Noticias." + RecuperaIdioma() + ".rss.axd");


	//Chama a estilização dos formulários
	EstilizaFormularios();
	
	
	//Dúvidas frequentes - Mostra e esconde o box de justificativa
	$('[id*=rbtnlBoxInformacao_1]').unbind('click');
	$('[id*=rbtnlBoxInformacao_0]').unbind('click');
	$('[id*=rbtnlBoxInformacao_1]').click(function(){$('[id*=txtJustificativa]').css('display', 'block');$('[id*=lblJustificativa]').css('display', 'block');});
	$('[id*=rbtnlBoxInformacao_0]').click(function(){$('[id*=txtJustificativa]').css('display', 'none');$('[id*=lblJustificativa]').css('display', 'none');});	
	
});
/*--------------------------------------------------------
Função que customiza os Formulários
--------------------------------------------------------*/
function EstilizaFormularios()
{
	/*---------------------------------------------------
	  Configura os calendários para os campos de data
	----------------------------------------------------*/
	$.datepicker.setDefaults
	(
	    {
		    closeText: 'Fechar',
		    prevText: '&#x3c;Anterior',
		    nextText: 'Pr&oacute;ximo&#x3e;',
		    currentText: 'Hoje',
		    monthNames: ['Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho', 'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun', 'Jul','Ago','Set','Out','Nov','Dez'],
		    dayNames: ['Domingo','Segunda-feira','Ter&ccedil;a-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sabado'],
		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
		    dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
		    weekHeader: 'Sm',
		    dateFormat: 'dd/mm/yy',
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
    
	if($(".Formulario").size() > 0)
	{	
		/*---------------------------------------------------
	     Aplica os calendarios
	     ----------------------------------------------------*/
		$(".Formulario input[alt*='date']").datepicker();
		
		/*---------------------------------------------------
		  Aplicação do Megaform
     	----------------------------------------------------*/
		$(".Formulario input[type='file']").megaform('fileupload');	
	    $(".Formulario select").megaform('dropdownlist');
	    $(".Formulario input[type='text'],textarea").megaform('textbox');
	 
	    $(".Formulario input[type='radio']").megaform('radiobuttonlist');
	    $(".Formulario input[type='checkbox']").megaform('checkboxlist');
	    $('input:password').megaform('textbox');
	}
	
	$('.Formulario input:text').setMask();
}

/*--------------------------------------------------
Recupera o idioma
--------------------------------------------------*/
function RecuperaIdioma()
{
	var strCaminho = window.location.pathname;
	strCaminho = strCaminho.substr(1,5);	
	
	return strCaminho;
}



/*------------------------------------------------------------------------------------------
   Função utilizada para fazer contagem decrescente de caracteres em um textbox.
   Um elemnto <span class='contadorDecrescente'> deve ser exibido como contador e a função
   chamada no método onkeyup do campo.
------------------------------------------------------------------------------------------*/ 
function Maxlength(strCampoClientID, intQuantidadeCaracteres, blnAtualizarContador)
{
  	if (!blnAtualizarContador)
  	{
    	if (document.getElementById(strCampoClientID).value.length >= intQuantidadeCaracteres)
        	return false;
      	else
      		return true;
  	}
  	else
  	{
    	if (document.getElementById(strCampoClientID).value.length > intQuantidadeCaracteres)
        	document.getElementById(strCampoClientID).value = document.getElementById(strCampoClientID).value.substr(0, intQuantidadeCaracteres);
     	if (document.getElementById('contadorDecrescente'))
        	document.getElementById('contadorDecrescente').innerHTML = intQuantidadeCaracteres - document.getElementById(strCampoClientID).value.length;
  	}
}

/*------------------------------------------------------------------------------------------
   Função utilizada para fazer contagem crescente de caracteres em um textbox.
   Um elemnto <span class='contadorCrescente'> deve ser exibido como contador e a função
   chamada no método onkeyup do campo.
------------------------------------------------------------------------------------------*/
function MinLength(strCampoClientID,intQuantidadeCaracteres)
{
	if(document.getElementById(strCampoClientID).value.length > intQuantidadeCaracteres) 
  		document.getElementById(strCampoClientID).value =  document.getElementById(strCampoClientID).value.substr(0, intQuantidadeCaracteres);
 	else
  	{
  		try
  		{
      		document.getElementById('contadorCrescente').innerHTML = document.getElementById(strCampoClientID).value.length;
    	}
    	catch(ex){}
  	}
}

/*-------------------------------------------------------------------------
			Correção erro no post do form de uatp - Empresas
-------------------------------------------------------------------------*/
$(document).ready(function(){        
    $("table[id*='rdVencimento'] input").click(function()
    {
        var id = $(this).attr('id');
        __doPostBack(id, '');
    });
});