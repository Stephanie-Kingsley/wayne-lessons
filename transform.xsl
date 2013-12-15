<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="tei xs"
    version="2.0">
    <!-- when it's all working, remove indent="yes" -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/tei:TEI">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
        <!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
        <!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
        <!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
                <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
                <link rel="stylesheet" href="stylesheets/styles.css" />
                <title>
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
            </head>
            <body>
                <!--[if lt IE 8]>
                    <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
                <![endif]-->
                <div class="container" role="main">
                    <div class="page-header">
                        <h1><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>
                    </div>
                    <xsl:apply-templates select="tei:text"/>
                </div>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
                <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
                <script src="javascript/plugin.js"></script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:front">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="tei:listWit">

        <h2>Witnesses</h2>
        <div class="list-group">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="tei:witness">
        <a href="#" class="list-group-item" data-id="{@xml:id}"><xsl:apply-templates /></a>
    </xsl:template>

    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <span class="apparatus"><xsl:apply-templates /></span>
    </xsl:template>
    
    <xsl:template match="tei:rdg">
        <span class="reading" data-witness="{@wit}"><xsl:apply-templates /></span>
    </xsl:template>
</xsl:stylesheet>
