<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="backRock">background-color:Bisque; width:45%; float:left; margin-left:3%; margin-top:2%; border:1px solid blue; border-radius:20px;</xsl:variable>
    <xsl:variable name="backRap">background-color:lightgray; width:45%; float:left; margin-left:3%; margin-top:2%; border:1px solid blue; border-radius:20px;</xsl:variable>
    <xsl:variable name="backMetal">background-color:Gainsboro; width:45%; float:left; margin-left:3%; margin-top:2%; border:1px solid blue; border-radius:20px;</xsl:variable>
    
    <xsl:template match="/">
    <html>
        <head>
            <title>Sklep Muzyczny</title>
            <link rel="stylesheet" type="text/css" href="arkusz.css" />
        </head>
        <body>
            <xsl:for-each select="/albumy/album">
                <xsl:if test="@type='rock'">
                    <div style="{$backRock}">
                        <xsl:call-template name="all"/>
                    </div>
                </xsl:if>
                <xsl:if test="@type='rap'">
                    <div style="{$backRap}">
                        <xsl:call-template name="all"/>
                    </div>
                </xsl:if>
                <xsl:if test="@type='metal'">
                    <div style="{$backMetal}">
                        <xsl:call-template name="all"/>
                    </div>
                </xsl:if>
            </xsl:for-each>
        </body>
    </html>
    </xsl:template>
        <xsl:template name="all">
        <div style="float:left; margin-left:5%; color:blue; text-align:center; width:50%;">
            <h2><span class="stala">Autor: </span><xsl:value-of select="autor"/></h2>
            <h2><span class="stala">Tytuł: </span><br/><xsl:value-of select="tytul"/></h2>
            <h3><span class="stala">Cena: </span><xsl:value-of select="cena"/>&#160;<xsl:value-of select="cena/@waluta"/>.</h3>
            <h3><span class="stala">Utworów na płycie: </span><xsl:value-of select="ilosc_utworow"/></h3>
        </div>
        <img style="height:40%;  float:right; border-top-right-radius:20px; border-bottom-right-radius:20px;">
            <xsl:attribute name="src">
                <xsl:value-of select="okladka" />
            </xsl:attribute>
        </img>
    </xsl:template>
</xsl:stylesheet>