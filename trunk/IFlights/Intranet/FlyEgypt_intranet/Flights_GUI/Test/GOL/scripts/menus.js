/*---------------------------------------------------------------------
  Este arquivo cont�m todos os scripts de configura��o de menus do site
----------------------------------------------------------------------*/

$(document).ready(function(){
	/*-------------
 	  Menu lateral
 	---------------*/
	//Chamando a fun��o que ir� percorrer o menu
    PercorrerMenuLateral(10);
    
    //Chama a  fun��o que adicona o ativo para os itens do agencias e empresas
    AtivoAgenciasEmpresas();
    
    //Chamando a fun��o que ir� percorrer o menu
    PercorrerMenuLateral(1, UrlsTargetBlank);
    
    //Array contendo as url dos itens que devem abrir em nova janela
     var UrlsTargetBlank = ['/pt-br/a-gol/blog-voe-gol/paginas/default.aspx'];
 
    //Percorrendo os itens para adicionar a propriedade targed blank
    for(var i in UrlsTargetBlank)
    {
        $("a[href='"+UrlsTargetBlank[i]+"']").attr("target", "_blank")
    }
       
	/*-------------
 	  Menu Superior
 	---------------*/
	PercorrerMenuSuperior();
	$(".Superior ul li:last-child").addClass("Ultimo");

    $(".Superior ul > li").hover(function(){if(!$("a",$(this)).hasClass("Ativo")){var a=$("> a img",$(this)).attr("src");a=a.replace(".png","-ativo.png");$("> a img",$(this)).attr("src",a)}},function(){if(!$("a",$(this)).hasClass("Ativo")){var a=$("a > img",$(this)).attr("src");a=a.replace("-ativo.png",".png");$("a > img",$(this)).attr("src",a)}});
    
    //Esconde todos os subitens do menu
	$(".Superior .Content").hide();
	$(".Superior > div > ul > li > .Content > ul").each(function(){if($(" > li",$(this)).size()>0){var a=$('<img style="border-width: 0px;" src="/Util/Imagens/Estrutura/nav-superior-footer-segundo-nivel.png" class="DisplayBlock" />');$(this).after(a)}});		

	//Adiciona evento de hover na li
	$(".Superior li").hover(function(){$(".Content",$(this)).show()},function(){$(".Content",$(this)).hide()});
	
	//Fun��o que adiciona o icone ativo ao menu 
	if($('.Superior ul > li a').hasClass('Ativo'))
	{
		var srcImg = $('.Superior ul > li .Ativo img').attr('src');
		srcImg = srcImg.replace('.png', '-ativo.png');
		$('.Superior ul > li .Ativo img').attr('src', srcImg);
	}
	
	//Remove os subitens do menu superior
	$('[id*=MossMenuSuperior] ul li .Content').remove();	

    /*----------------------
	  Menu P�blico
	---------------------- */
	PercorrerMenuPublico(10);
	$(".Publico ul li:last").addClass("Ultimo"); 
	
	/*--------------------------------
	  Menu apoio
	---------------------------------*/
	$(".Apoio ul li:last").addClass("Ultimo");
	
	/*---------------------------------
	  Menu Lateral
	---------------------------------*/
	LateralSecundario();
	PercorrerMenuSecundario();
});

/*--------------------------------------------------------------------------
Fun��o que monta as URLS dos itens do menu
----------------------------------------------------------------------------*/
function MontarUrl(intQuantidadeNiveis)
{
	//Resgatando a url completa
 	var strUrl = window.location.pathname;
 	//Dividinto a url em partes atrav�s da hierarquia de /
 	var strPartesUrl = strUrl.split('/');
 	
 	//Resgatando a lingua da url, ex: pt-br
 	var strLingua = '/' + strPartesUrl[2];
 	
 	//Resgatando a parte final da url, ex: /paginas/default.aspx
 	var strUltimaParteUrl = '/' + strPartesUrl[strPartesUrl.length - 2] + '/default.aspx';

   	//Instanciando a vari�vel que ser� retornada contendo a url montada
   	var strUrlMontada = '/' + strPartesUrl[1] +  strLingua;
 	   
   	//Percorre as partes da url de acordo com a quantidade de n�veis passado como par�metro
   	for( intContador = 0; intContador < intQuantidadeNiveis; intContador++)
   	{
		//Adiciona o n�vel atual a url
		strUrlMontada += "/" + strPartesUrl[intContador + 3];
	}
     	   
	//Adiciona a parte final da url
	strUrlMontada += strUltimaParteUrl;
 	   
	//Retorna em lower case para evitar erros de formatação
	return strUrlMontada.toLowerCase();
}

function MontarUrlSuperior(){
	//Resgatando a url completa
 	var strUrl = window.location.pathname;
 	//Dividinto a url em partes atrav�s da hierarquia de /
 	var strPartesUrl = strUrl.split('/');
 	
 	//Resgatando a lingua da url, ex: pt-br
 	var strLingua = '/' + strPartesUrl[1];
 	
 	//Resgatando a lingua da url, ex: pt-br
 	var strSite = '/' + strPartesUrl[2];
 	
 	//Resgatando a parte final da url, ex: /paginas/default.aspx
 	var strUltimaParteUrl = '/' + strPartesUrl[strPartesUrl.length - 2] + '/default.aspx';

 	//Instanciando a vari�vel que ser� retornada contendo a url montada
 	var strUrlMontada = strLingua + strSite;
 	      	   
	//Adiciona a parte final da url
	strUrlMontada += strUltimaParteUrl;
 	   
	//Retorna em lower case para evitar erros de formata��o
	return strUrlMontada.toLowerCase();
}

/*--------------------------------------------------------------------------------------------------------------
  Esta fun��o atribue as classes necess�rias ao menu e o exibe de acordo com elemento 'a' passado como par�metro
----------------------------------------------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------------------------------------------------
  Esta fun��o percorre o menu e exibe os n�veis ativos de acordo com a quantidade de n�veis passados como par�mentro
--------------------------------------------------------------------------------------------------------------------*/
function PercorrerMenuLateral(intNiveisVisiveis)
{
    //Percorrendo todos os elementos 'a' dentro da div com classe 'Lateral'
    $('.Lateral a').each(function(){
        //La�o que percorre a quantidade de n�veis desejados verificando se a url � igual a gerada pela fun��o 'MontarUrl'
        for( intContador = 0; intContador < intNiveisVisiveis; intContador++)
        {
            //Caso a url atual for igual a url gerada ent�o exibir este n� do menu
            if ($(this).attr("href").toLowerCase() == MontarUrl(intContador))
            {
                //Atribuindo a classe ativo ao elemento 'ul' que fica acima
				$(this).parent().addClass('Ativo');
			     
			    //Exibindo o pr�ximo n�vel do menu
			    $(this).next('ul').show();
            }
        }
    });	
}

function PercorrerMenuSuperior(){
    //Percorrendo todos os elementos 'a' dentro da div com classe 'Superior'
    $('.Nav .Superior a').each(function(){
    	//Caso a url atual for igual a url gerada ent�o exibir este n� do menu 
        if ($(this).attr("href").toLowerCase().indexOf(MontarUrlSuperior())>-1)
        {
            $(this).addClass('Ativo');
        }
    });	
}
function PercorrerMenuPublico(intNiveisVisiveis){
    //Percorrendo todos os elementos 'a' dentro da div com classe 'Lateral'
    $('.Publico a').each(function(){
        //Laço que percorre a quantidade de níveis desejados verificando se a url é igual a gerada pela função 'MontarUrl'
        for( intContador = 0; intContador < intNiveisVisiveis; intContador++)
        {
            //Caso a url atual for igual a url gerada então exibir este nó do menu
            if ($(this).attr("href").toLowerCase() == MontarUrl(intContador))
            {
                $(this).addClass('Ativo');
            }
        }
    });	
}

function PercorrerMenuSecundario(){
    //Percorrendo todos os elementos 'a' dentro da div com classe 'Superior'
    $('.Secundario a').each(function(){
    	//Caso a url atual for igual a url gerada ent�o exibir este n� do menu 
        if ($(this).attr("href").toLowerCase() == window.location.pathname)
        {
            $(this).addClass('Ativo');
        }
    });	
}
/*------------------------------------------------------------
	Fun��o que adiciona o ativo para as areas Agencias - Empresas
-------------------------------------------------------------*/
function AtivoAgenciasEmpresas(){
	var urlatual = window.location.pathname.indexOf("/empresas/");
	if(urlatual == "6")
	{
	  $('.Header .Nav .Publico ul li a').each(function(){
	    var itemmenu = $(this).attr('href').indexOf("/empresas/");
	        if(itemmenu == "6"){
	            $(this).addClass('Ativo');    
	        }
	  });  
	}

	var urlatual = window.location.pathname.indexOf("/agencias/");
	if(urlatual == "6")
	{
	  $('.Header .Nav .Publico ul li a').each(function(){
	    var itemmenu = $(this).attr('href').indexOf("/agencias/");
	        if(itemmenu == "6"){
	            $(this).addClass('Ativo');    
	        }
	  });  
	}
}


/*------------------------------------------------------------
	Fun��o que monta o menu lateral Secund�rio
------------------------------------------------------------*/
function LateralSecundario(){
	$('.Nav .Lateral li.Ativo > ul').appendTo($(".Nav .Lateral .Secundario"));
	$(".Nav .Lateral .Secundario ul").css({'display':'block'});
		
		
	$(".Nav .Lateral .Secundario ul li a").after('<span>|</span>');
    $(".Nav .Lateral .Secundario ul li:last span").remove();
    		
    
	if($('.Secundario ul').height() <= '15'){
		$('.Secundario').css('display','none') 
	}
	
	$('.Nav .Lateral .Secundario li.Ativo').removeAttr('class');
}
