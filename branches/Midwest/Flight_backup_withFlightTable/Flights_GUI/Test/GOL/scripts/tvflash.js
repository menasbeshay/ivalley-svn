
$(document).ready(function () { 
	/*------------------------------------------------------
	Chamada das funções da TV Flash com acessibilidade da home
	------------------------------------------------------*/
	//Carrega o Flash
	CallSWFObjectTVFlashHome();
	CallSWFObjectTVFlashHomeSmiles();
	jQuery(".Destinos .Centro, .Destinos .Conteudo").css({width:"100%"});
	CallSWFObjectTVFlashDestinos();
	CallSWFObjectTVFlashAgenciasEmpresas();
	
	//Anima as imagens da TV Flash, caso o Flash Player não esteja habilitado
	$('.slideshow').cycle({fx: 'fade'});

});

/*----------------------------------------------------------------------
 * Função responsáveis por criar criar a TV Flash com acessibilidade 
----------------------------------------------------------------------*/
function CallSWFObjectTVFlashHome()
{
	swfobject.embedSWF("/util/swf/voe_gol_cs4_2.swf","HeaderAlternateContentTVFlashHome","570","376","9.0",
	null, null, {allowscriptaccess:"sameDomain", allowfullscreen:"false", menu:"false",
	bgcolor:"#FFFFFF", devicefont:"false", wmode:"transparent", scale:"showall" },null);
}

function CallSWFObjectTVFlashHomeSmiles()
{
	swfobject.embedSWF("/util/swf/tv-flash-smiles.swf","HeaderAlternateContentTVFlashHomeSmiles","570","376","9.0",
	null, null, {allowscriptaccess:"sameDomain", allowfullscreen:"false", menu:"false",
	bgcolor:"#FFFFFF", devicefont:"false", wmode:"transparent", scale:"showall" },null);
}

function CallSWFObjectTVFlashDestinos()
{
	swfobject.embedSWF("/Destinos/PublishingImages/Main.swf","HeaderAlternateContentFlashDestinos","929","702","9.0",
	null, null, {allowscriptaccess:"sameDomain", allowfullscreen:"false", menu:"false",
	bgcolor:"#FFFFFF", devicefont:"false", wmode:"transparent", scale:"showall" },null);
}

function CallSWFObjectTVFlashAgenciasEmpresas()
{
	//Chama a TV Flash de agências
	if(window.location.pathname.toLowerCase().indexOf('agencias')>-1)
	{
		swfobject.embedSWF("/util/swf/voe_gol_cs4_2.swf","HeaderAlternateContentTVFlashAgenciasEmpresas","570","376","9.0",
		null, null, {allowscriptaccess:"sameDomain", allowfullscreen:"false", menu:"false",
		bgcolor:"#FFFFFF", devicefont:"false", wmode:"transparent", scale:"showall" },null);
	}
	//Chama a TV Flash de Empresas
	else if(window.location.pathname.toLowerCase().indexOf('empresas')>-1)
	{
		swfobject.embedSWF("/util/swf/voe_gol_cs4_2.swf","HeaderAlternateContentTVFlashAgenciasEmpresas","570","376","9.0",
		null, null, {allowscriptaccess:"sameDomain", allowfullscreen:"false", menu:"false",
		bgcolor:"#FFFFFF", devicefont:"false", wmode:"transparent", scale:"showall" },null);
	}
}

