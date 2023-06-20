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
                    <a href="#manoscitto" class="textnav">Manoscritto</a>
                    <a href="#codifica" class="textnav">Codifica</a>

                </nav>
                <div id="header">
                    <h1 class="titolo"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>
                    <h2 class="subtitle"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/></h2>
                </div>
                <h2 class="textimportant">Informazioni utili</h2>
                <div class="cardtot">
                    <div class="flex gap-5">
                        <div id="info" class="halfcard">
                            <h3 class="textimp">Codifica</h3>
                            <p class="center"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition"/></p>
                            <p><label class="bold">Curatore: </label> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:editor"/></p>
                            <p><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability"/></p>
                        </div>
                        <div id="manoscritto" class="halfcard">
                            <h3 class="textimp">Manoscritto</h3>
                            <p><label class="bold">Istituzione: </label> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:institution"/></p>
                            <p><label class="bold">Luogo: </label> <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:country"/>, <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/></p>
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
                </div>
                <xsl:apply-templates select="tei:TEI/tei:text/tei:body"/>

            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:msItemStruct">
        <div class="w-2/6">
            <p>Parte numero: <xsl:value-of select="@n" /> - <xsl:value-of select="tei:title" /></p>
            <p>Autore: <xsl:value-of select="tei:author"/></p>
            <p>Info: <xsl:value-of select="tei:note"/></p>
        </div>
    </xsl:template>
    <xsl:template match="tei:physDesc">
        <p><label class="bold">Supporto: </label> <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:support"/></p>
        <p><label class="bold">Grandezza: </label> <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:extent"/></p>
        <p><label class="bold">Condizioni: </label> <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:condition"/></p>
        <p><label class="bold">Tipo scrittura: </label> <xsl:value-of select="tei:handDesc"/></p>
    </xsl:template>


</xsl:stylesheet>