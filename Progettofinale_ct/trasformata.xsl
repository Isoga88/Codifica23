<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" >
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html lang="IT">
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link href="https://fonts.googleapis.com/css2?family=Ubuntu" rel="stylesheet"/>

                <script src="https://cdn.tailwindcss.com"></script>
                <link rel="stylesheet" href="style.css" type="text/css"/>
                <title>Progetto di Gabriele Isola, Codifica di Testi </title>
            </head>
            <body>
                <nav class="navbar">
                    <a href="#info" class="textnav">Info</a>
                    <a href="#codifica" class="textnav">Codifica</a>

                </nav>
                <div id="header">
                    <h1 class="titolo"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>
                    <h2 class="subtitle"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/></h2>
                </div>
                <h2 class="textimportant">Informazioni utili</h2>
                <div class="cardtot">
                    <div id="info" class="halfcard">
                        <h3 class="textimp">Codifica</h3>
                        <p class="center"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition"/></p>
                        <p><div class="bold">Curatore: </div> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:editor"/></p>
                        <p><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability"/></p>
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
                <div class="flex flex-wrap gap-5 justify-around py-4">
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="correction" type="checkbox" class="sr-only peer/correction" />
                        <div onclick="changeCorrection()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/correction:after:translate-x-full peer-checked/correction:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/correction:bg-blue-600"></div>
                        <span class="text-sm font-medium text-gray-900 ">Correzioni</span>
                    </div>
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="place" type="checkbox" class="sr-only peer/place" />
                        <div onclick="changePlace()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/place:after:translate-x-full peer-checked/place:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/place:bg-red-600"></div>
                        <span class="text-sm font-medium text-gray-900 ">Luoghi</span>
                    </div>
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="person" type="checkbox" class="sr-only peer/person" />
                        <div onclick="changePerson()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/person:after:translate-x-full peer-checked/person:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/person:bg-yellow-600"></div>
                        <span class="text-sm font-medium text-gray-900 ">Persone</span>
                    </div>
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="normalization" type="checkbox" class="sr-only peer/normalization" />
                        <div onclick="changeNormalization()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/normalization:after:translate-x-full peer-checked/normalization:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/normalization:bg-zinc-600"></div>
                        <span class="text-sm font-medium text-gray-900 ">Normalizzazioni</span>
                    </div>
                    <div class="relative inline-flex items-center cursor-pointer">
                        <input id="erasures" type="checkbox" class="sr-only peer/erasures" />
                        <div onclick="changeErasures()" class="w-11 h-6 bg-gray-200 rounded-full peer-checked/erasures:after:translate-x-full peer-checked/erasures:after:border-white after:content-[''] after:absolute after:top-0.5 after:left-[2px] after:bg-white after:border-gray-300 after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked/erasures:bg-green-600"></div>
                        <span class="text-sm font-medium text-gray-900">Cancellature</span>
                    </div>
                </div>
                <div class="flex">
                    <xsl:apply-templates select="tei:TEI/tei:text/tei:body"/>
                </div>
            <script type="text/javascript" src="script.js"></script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:msItemStruct">
        <xsl:element name="div">
            <xsl:attribute name="class">divide<xsl:value-of select="@n" />  w-2/6</xsl:attribute>
            <p><xsl:value-of select="tei:title" /></p>
            <p>Autore: <xsl:value-of select="tei:author"/></p>
            <p>Info: <xsl:value-of select="tei:note"/></p>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:physDesc">
        <p n="2"><div class="bold">Supporto: </div> <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:support"/></p>
        <p><div class="bold">Grandezza: </div> <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:extent"/></p>
        <p><div class="bold">Condizioni: </div> <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:condition"/></p>
        <p><div class="bold">Tipo scrittura: </div> <xsl:value-of select="tei:handDesc"/></p>
    </xsl:template>


    <xsl:template match="tei:ab">
        <xsl:element name="div">                    
            <xsl:attribute name="id">pag<xsl:value-of select="[@n]"/></xsl:attribute>
            <xsl:attribute name="class">flex items-center w-full</xsl:attribute>
            <xsl:element name="div">
                <xsl:attribute name="class">page text-sm w-1/2 pl-2 text-center</xsl:attribute>
                <xsl:apply-templates />
            </xsl:element>  
            <xsl:element name="div">
                <xsl:attribute name="class">w-1/2</xsl:attribute>
                <xsl:element name="img">
                    <xsl:attribute name="src">image/pag<xsl:value-of select="[@n]"/>.jpg</xsl:attribute>
                    <xsl:attribute name="alt">page<xsl:value-of select="[@n]"/></xsl:attribute>
                    <xsl:attribute name="class">h-[32rem] </xsl:attribute>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>


    <xsl:template match="tei:pb">
            <xsl:element name="h3">
                <xsl:attribute name="class">font-sm title text-center</xsl:attribute>
                Pagina <xsl:value-of select="[@n]"/>
            </xsl:element>
    </xsl:template>
  
    <xsl:template match="tei:lb">
        <xsl:element name="br"></xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="class">line</xsl:attribute><xsl:value-of select="@n" />&#160;
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:floatingText">
        <xsl:element name="span">
            <xsl:attribute name="class">italic</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:placeName">
        <xsl:element name="span">
            <xsl:attribute name="class">place</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:persName">
        <xsl:element name="span">
            <xsl:attribute name="class">person</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
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




    

    <!-- abbreviazione -->
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>




    <!--errori-->
    <xsl:template match="tei:sic">
        <xsl:element name="span">
            <xsl:attribute name="class">sic hide</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- cancellature -->



    <!-- agg. editoriale -->
    <xsl:template match="tei:supplied">
        <xsl:element name="span">
            <xsl:attribute name="class">supplied hide</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- espansione -->
    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan hide</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
        <!-- correzione -->
    <xsl:template match="tei:corr">
        <xsl:element name="span">
            <xsl:attribute name="class">corr hide</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>