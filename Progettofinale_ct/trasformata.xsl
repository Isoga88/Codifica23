<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" >
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html lang="IT">
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link href="https://fonts.googleapis.com/css2?family=Ubuntu" rel="stylesheet"/>

                <script src="https://cdn.tailwindcss.com"></script>
                <link rel="stylesheet" href="src/style.css" type="text/css"/>
                <title>Progetto di Gabriele Isola, Codifica di Testi </title>
            </head>
            <body>
                <nav class="navbar">
                    <a href="#info" class="textnav">Info</a>
                    <a href="#codifica" class="textnav">Codifica</a>
                    <a href="#liste" class="textnav">Liste</a>
                </nav>
                <div id="header">
                    <h1 class="titolo"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>
                    <h2 class="subtitle"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/></h2>
                </div>
                <h2 id="info" class="textimportant">Informazioni utili</h2>
                <div class="cardtot">
                    <div id="info" class="halfcard">
                        <h3 class="textimp">Codifica</h3>
                        <p class="center"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition"/></p>
                        <p><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability"/></p>
                        <p><div class="bold">Esecutore: </div> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt/tei:persName"/></p>
                        <p><div class="bold">Curatore: </div> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:editor"/></p>
                        <p><div class="bold">Organizzazione: </div> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:sponsor"/></p>
                        <p><div class="bold">Realizzata nel: </div> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/></p>
                    </div>
                    <div id="manoscritto" class="halfcard">
                        <h3 class="textimp">Manoscritto</h3>
                        <p><div class="bold">Istituzione: </div> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:institution"/></p>
                        <p><div class="bold">Luogo: </div> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:country"/>, <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/></p>
                        <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc"/>
                    </div>
                </div>
                <div class="card">
                    <h3 class="textimp">Testo</h3>
                    <p class="center"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:summary"/></p>
                    <p class="center">Diviso in:</p>
                    <div class="flex">
                        <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:msItemStruct"/>
                    </div>
                </div>
                <h2 id="codifica" class="textimportant pt-12 pb-5">Codifica del testo</h2>
                <div class="flex text-center justify-center align-center">
                    <button onclick="changePage(-1)" type="button" class="button">pagina precedente</button>
                    <button onclick="changePage(1)" type="button" class="button">pagina successiva</button>
                </div>
                <div class="flex flex-wrap gap-x-32 gap-y-2 justify-around py-4">
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="correction" type="checkbox" class="sr-only peer/correction" />
                        <div onclick="changeCorrection()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/correction:after:translate-x-full peer-checked/correction:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/correction:bg-blue-300"></div>
                        <span class="ml-1 text-sm font-medium text-gray-900 ">Correzioni</span>
                    </div>
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="place" type="checkbox" class="sr-only peer/place" />
                        <div onclick="changePlace()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/place:after:translate-x-full peer-checked/place:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/place:bg-red-300"></div>
                        <span class="ml-1 text-sm font-medium text-gray-900 ">Luoghi</span>
                    </div>
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="person" type="checkbox" class="sr-only peer/person" />
                        <div onclick="changePerson()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/person:after:translate-x-full peer-checked/person:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/person:bg-yellow-300"></div>
                        <span class="ml-1 text-sm font-medium text-gray-900 ">Persone</span>
                    </div>
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="normalization" type="checkbox" class="sr-only peer/normalization" />
                        <div onclick="changeNormalization()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/normalization:after:translate-x-full peer-checked/normalization:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/normalization:bg-zinc-400"></div>
                        <span class="ml-1 text-sm font-medium text-gray-900 ">Normalizzazioni</span>
                    </div>
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="erasures" type="checkbox" class="sr-only peer/erasures" />
                        <div onclick="changeErasures()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/erasures:after:translate-x-full peer-checked/erasures:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/erasures:bg-green-300"></div>
                        <span class="ml-1 text-sm font-medium text-gray-900">Cancellature</span>
                    </div>
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="abbrevation" type="checkbox" class="sr-only peer/abbrevation" />
                        <div onclick="changeAbbrevation()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/abbrevation:after:translate-x-full peer-checked/abbrevation:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/abbrevation:bg-orange-300"></div>
                        <span class="ml-1 text-sm font-medium text-gray-900">Abbreviazioni</span>
                    </div>
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="supplied" type="checkbox" class="sr-only peer/supplied" />
                        <div onclick="changeSupplied()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/supplied:after:translate-x-full peer-checked/supplied:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/supplied:bg-violet-300"></div>
                        <span class="ml-1 text-sm font-medium text-gray-900">Aggiunte editoriali</span>
                    </div>
                </div>
                <div class="flex">
                    <xsl:apply-templates select="tei:TEI/tei:text/tei:body"/>
                </div>
                <section id="liste" class="pt-12">
                    <h2 id="info" class="textimportant">Liste</h2>
                    <div id="personMenu" onclick="openMenu(this)" class="flex flex-col max-h-min my-1 justify-center p-3 mx-auto bg-white border border-gray-200 rounded-lg shadow min-w-[94%] max-w-[94%] ">
                        <div>
                            <div class="w-full flex justify-between items-center gap-2 ">
                                <div class="text-xl font-extrabold text-left">Persone</div>
                                <div class="arrowbtn" id="arrowbtn"></div><div  id="arrowbtn2"  class=" arrowbtn2 hide"></div>
                            </div>
                            <div class="hide w-full text-center flex flex-col gap-3 elementList">
                                <xsl:apply-templates select="tei:TEI/tei:standOff/tei:listPerson/tei:person"/>
                            </div>
                        </div>
                    </div>
                    <div id="placeMenu" onclick="openMenu(this)" class="flex flex-col max-h-min my-1 justify-center p-3 mx-auto bg-white border border-gray-200 rounded-lg shadow  min-w-[94%] max-w-[94%] ">
                        <div>
                            <div class="w-full flex justify-between items-center gap-2 ">
                                <div class="text-xl font-extrabold text-left">Luoghi</div>
                                <div class="arrowbtn" id="arrowbtn"></div><div  id="arrowbtn2"  class=" arrowbtn2 hide"></div>
                            </div>
                            <div class="hide w-full text-center flex flex-col gap-3 elementList">
                                <xsl:apply-templates select="tei:TEI/tei:standOff/tei:listPlace/tei:place"/>
                            </div>
                        </div>
                    </div>
                    <div id="organizationMenu" onclick="openMenu(this)" class="flex flex-col max-h-min my-1 justify-center p-3 mx-auto bg-white border border-gray-200 rounded-lg shadow  min-w-[94%] max-w-[94%] ">
                        <div>
                            <div class="w-full flex justify-between items-center gap-2 ">
                                <div class="text-xl font-extrabold text-left">Organizzazioni</div>
                                <div class="arrowbtn" id="arrowbtn"></div><div id="arrowbtn2"  class=" arrowbtn2 hide"></div>
                            </div>
                            <div class="hide w-full text-center flex flex-col gap-3 elementList">
                                <xsl:apply-templates select="tei:TEI/tei:standOff/tei:listOrg/tei:org"/>
                            </div>
                        </div>
                    </div>
                </section>
            <script type="text/javascript" src="src/script.js"></script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:msItemStruct">
        <xsl:element name="div">
            <xsl:attribute name="class">divide<xsl:value-of select="@n" />  w-2/6</xsl:attribute>
            <p class="bold text-center"><xsl:value-of select="tei:title"/></p>
            <p><div class="bold">Autore: </div><xsl:value-of select="tei:author"/></p>
            <p><div class="bold">Info: </div> <xsl:value-of select="tei:note"/></p>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <p n="2"><div class="bold">Supporto: </div> <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:support"/></p>
        <p><div class="bold">Grandezza: </div> <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:extent"/></p>
        <p><div class="bold">Condizioni: </div> <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:condition"/></p>
        <p><div class="bold">Tipo scrittura: </div> <xsl:value-of select="tei:handDesc"/></p>
    </xsl:template>


    <xsl:template match="tei:ab">
        <xsl:for-each-group select="node()" group-starting-with="tei:pb">
            <xsl:if test="position() != 1">
                <xsl:element name="div">                    
                    <xsl:attribute name="id">pag<xsl:value-of select="position()-1"/></xsl:attribute>
                    <xsl:attribute name="class">flex max-md:justify-center max-md:flex-col items-center w-full</xsl:attribute>
                    <xsl:element name="div">
                        <xsl:attribute name="class">page text-sm w-1/2 pl-2 text-center</xsl:attribute>
                        <xsl:apply-templates select="current-group()"/>
                    </xsl:element>  
                    <xsl:element name="div">
                        <xsl:attribute name="class">w-1/2</xsl:attribute>
                        <xsl:element name="img">
                            <xsl:variable name="myNumber">
                                <xsl:value-of select="position()-1" />
                            </xsl:variable>
                            <xsl:attribute name="src">image/pag<xsl:value-of select="position()-1"/>.png</xsl:attribute>
                            <xsl:attribute name="alt">page<xsl:value-of select="position()-1"/></xsl:attribute>
                            <xsl:attribute name="class">max-w-none </xsl:attribute>
                            <xsl:attribute name="usemap">#page<xsl:value-of select="position()-1"/></xsl:attribute>
                            <xsl:apply-templates select="../../../../../tei:facsimile/tei:surface[@n=$myNumber]"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:element> 
            </xsl:if >
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template match="tei:surface">
        <xsl:element name="map">
            <xsl:attribute name="name">page<xsl:value-of select="[@n]"/></xsl:attribute>
            <xsl:apply-templates select="tei:zone"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:zone">
        <xsl:element name="area">
            <xsl:attribute name="class">elementZone</xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
            <xsl:attribute name="coords"><xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/></xsl:attribute>
            <xsl:attribute name="onmouseout">underlineEnd(<xsl:value-of select="[@xml:id]"/>)</xsl:attribute>
            <xsl:attribute name="onmouseover">underlineStart(<xsl:value-of select="[@xml:id]"/>)</xsl:attribute>

        </xsl:element>
    </xsl:template>


    <xsl:template match="tei:pb">
            <xsl:element name="h3">
                <xsl:attribute name="class">font-sm title text-center</xsl:attribute>
                Pagina <xsl:value-of select="substring-after(@xml:id, 'pag')"/>
            </xsl:element>
    </xsl:template>
  
    <xsl:template match="tei:lb">
        <xsl:if test="@break = 'no'">
            <span class="align-baseline ">=</span>
        </xsl:if>
        <xsl:element name="br"></xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="id">
                <xsl:value-of  select="substring-after(@facs, '#')"/>
            </xsl:attribute>
            <xsl:attribute name="class">line</xsl:attribute><xsl:value-of select="@n" />&#160;
        </xsl:element>
        <xsl:apply-templates/>

    </xsl:template>

    <xsl:template match="tei:floatingText">
        <xsl:element name="span">
            <xsl:attribute name="class">italic</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:placeName">
        <xsl:variable name="myPlace">
            <xsl:value-of select="substring-after(@ref, '#')" />
        </xsl:variable>
        <xsl:element name="span">
            <xsl:attribute name="class">place tooltip</xsl:attribute>
            <xsl:apply-templates/>
            <xsl:element name="span">
                <xsl:attribute name="class">tooltiptext <xsl:value-of select="$myPlace" /></xsl:attribute>
                <xsl:apply-templates select="//tei:listPlace/tei:place[@xml:id=$myPlace]"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:listPlace/tei:place">
        <div class="cardname">
            <div class="bold">Nome: </div><xsl:value-of select="tei:placeName"/><br/>
            <div class="bold">Provincia: </div><xsl:value-of select="tei:settlement[@type='province']"/><br/>
            <div class="bold">Regione: </div><xsl:value-of select="tei:settlement[@type='region']"/><br/>
            <div class="bold">Stato: </div><xsl:value-of select="tei:country"/><br/>
        </div>
    </xsl:template>

    <xsl:template match="tei:listOrg/tei:org">
        <div class="cardname">
            <div class="bold">Nome: </div><xsl:value-of select="tei:orgName"/><br/>
            <div class="bold">Luogo: </div><xsl:value-of select="tei:placeName"/><br/>
            <div class="bold">Descrizione: </div><xsl:value-of select="tei:desc"/><br/>
        </div>
    </xsl:template>


    <xsl:template match="tei:persName">
        <xsl:variable name="myPerson">
            <xsl:value-of select="substring-after(@ref, '#')" />
        </xsl:variable>
        <xsl:element name="span">
            <xsl:attribute name="class">person tooltip</xsl:attribute>
            <xsl:apply-templates/>
            <xsl:element name="span">
                <xsl:attribute name="class">tooltiptext</xsl:attribute>
                <xsl:apply-templates select="//tei:listPerson/tei:person[@xml:id=$myPerson]"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:listPerson/tei:person">
        <div class="cardname">
            <div class="bold">Nome: </div><xsl:value-of select="tei:persName"/><br/>
            <div class="bold">Sesso : </div><xsl:value-of select="tei:sex"/><br/>
            <div class="bold">Data nascita: </div><xsl:value-of select="tei:birth/tei:date"/>, <xsl:value-of select="tei:birth/tei:placeName/tei:settlement[@type='municipality']/text()"/><br/>
            <div class="bold">Data morte: </div><xsl:value-of select="tei:death/tei:date"/>, <xsl:value-of select="tei:death/tei:placeName/tei:settlement[@type='municipality']/text()"/>
        </div>
    </xsl:template>

    

    <xsl:template match="tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">normalization hide</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">del hide</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:add">
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>


    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan hide</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:supplied">
        <xsl:element name="span">
            <xsl:attribute name="class">supplied hide</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:sic">
        <xsl:element name="span">
            <xsl:attribute name="class">sic</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:corr">
        <xsl:element name="span">
            <xsl:attribute name="class">corr hide</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>