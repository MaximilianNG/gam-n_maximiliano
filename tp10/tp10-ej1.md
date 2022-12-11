# Módulo 6 - TP10 

## Ejercicio 1
a) Describe dos usos o funciones que proporciona la declaración DOCTYPE en una página web.

-> Todos los documentos HTML comienzan con una declaración DOCTYPE la cual no es, estrictamente hablando, una etiqueta de HTML, sino más bien una pieza de información para el explorador  que comunica qué tipo de documento o texto debe esperar.

Informar esto permite que la página web sea analizada sintácticamente de la misma forma por diferentes exploradores web. Además, validadores de marcado miran el tipo de documento para determinar con qué reglas debe ser verificado el archivo.

b) Describa para qué se utilizan las siguientes etiquetas:

* `<head></head>`: la etiqueta head normalmente contiene metadatos y llamados a scripts, no es renderizada pero la información que manipula es usada por exploradores y motores de búsqueda.
* `<title></title>`: esta etiqueta permite darle título a la página web. 
* `<meta>`: esta etiqueta también define metadatos de la página , siempre suele ir dentro de la etiqueta head y suele ser usada para definir el set de caracteres, descripción de la página, palabras clave, autor del documento, configuraciones de viewport, entre otros datos.
* `<style></style>`: se usa para definir información de estilo (CSS) de un documento.
* `<body></body>`: esta etiqueta define el cuerpo principal del documento y se usa para contener al resto de las etiquetas que compondrán el contenido principal.
* `<h1>...`: las etiquetas de encabezado se usan para marcar títulos en el contenido y para estructurar el sentido de más a menos importante.
* `<a>`: la etiqueta de ancla define un hipervínculo que se utiliza para navegar de una página a otra, o de una parte de una página a otra de esa misma página.
* `<strong>`: se utiliza para definir texto con fuerte importancia. Tradicionalmente esto se ve en negrita, pero el valor de la etiqueta es semántico, no de estilo (similar a las etiquetas h).
* `<br>`: esta etiqueta produce un salto de línea.
* `<ul>`: se utiliza para agrupar una colección de ítems que no posean cardinalidad, es decir que su orden no importe. ul quiere decir lista no ordenada.
* `<li>`: se utiliza dentro de la etiqueta `<ol>` de listas ordenadas, como dentro de menús.
* `<p>`: esta etiqueta define un párrafo.
* `<span>`: span suele ser un contenedor para marcar de alguna forma una parte de un texto o parte de un documento. Es flexible ya que es muy fácil de manipular con CSS o Javascript. Es similar a un div, pero div es de nivel bloque y span es inline.
* `<table></table>`: se usa para definir una tabla HTML donde...
* `<tr>`: ...define una fila dentro de la tabla y...
* `<td>`: ...define una celda.
* `<img>`: se utiliza para incrustar una imagen en una página HTML. Estas imágenes no son literalmente insertadas, sino más bien referenciadas, y la etiqueta img es el contenedor de la dirección de dónde deben ser buscadas y otras configuraciones referentes a la imagen.

c) La etiqueta `<script>` puede ir dentro de las etiquetas de `<body>` o de `<head>` , ¿hay alguna diferencia dónde pueda ir?

Cuando se inserta la etiqueta script en la etiqueta head nos aseguramos que el script se cargue antes que sea usado por cualquier instancia. Los scripts que solo deben ser cargados cuando se carga la página van en el body.
