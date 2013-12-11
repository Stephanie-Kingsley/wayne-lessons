<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://tei-c.org/"
    version="2.0">
    <xsl:template match="/tei:TEI">
        <html>
            <head>
                <link rel="stylesheet" href="styles.css" />
                <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
            </head>
            <body>
                <xsl:apply-templates select="text"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>    
        </p>
    </xsl:template>
</xsl:stylesheet>