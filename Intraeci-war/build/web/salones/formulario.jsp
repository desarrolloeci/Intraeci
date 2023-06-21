<html><head>
<title>Lista dependiente de lista desplegable</title>

</head>

<body style="font-family: Verdana;">


<script language="JavaScript">

function Combos(x) {
  ItDepend=document.getElementById('CombDependiente');
  if(!ItDepend){return;}
  var mitems=new Array();
  mitems['Elige']=[''];
  mitems['Clase']=['Elegir opción','700','830','1000','1130'];
  mitems['Uso Libre']=['Elegir opción','700','800','900','1000'];

  ItDepend.options.length=0;
  ItActual=mitems[x.options[x.selectedIndex].value];
  if(!ItActual){return;}
  ItDepend.options.length=ItActual.length;
  for(var i=0;i<ItActual.length;i++) {
    ItDepend.options[i].text=ItActual[i];
    ItDepend.options[i].value=ItActual[i];
  }
}
</script>


<form action="">
<label for="or">Área:</label>
<select name="or" id="or" onchange="Combos(this)">
  <option value="Elige">Elige</option>
  <option value="Clase">Clase</option>
  <option value="Uso Libre">Uso Libre</option>
 
</select>
<label for="CombDependiente">Hora:</label>
<select name="CombDependiente" id="CombDependiente"></select>
<input type="submit" value="Ir" />
</form>

<p/><center>
 </center><p/></body></html>