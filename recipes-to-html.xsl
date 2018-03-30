<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:r="http://recipes.org">
    
    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                encoding="UTF-8"
                indent="yes"
    />
    
    <xsl:template match="r:collection">
        <head>
            <title>Collection of Recipes</title>
            <meta http-equiv="Content-Style-Type" content="text/css"/>
            <link rel="stylesheet" href="recipes.css" type="text/css" media="screen"/>
        </head>
        <body>
            <h1>
                Collection of Recipes
            </h1>
            <hr/>
            <h2>List of Recipes</h2>
            <ul>
                <xsl:apply-templates select="r:recipe" mode="list" />
            </ul>

            <xsl:apply-templates select="collection/description" />

            <h2>Recipes</h2>
            <xsl:apply-templates select="r:recipe" />

        </body>
    </xsl:template>
    
    <xsl:template match="r:recipe" mode="list">
        <li>
            <a href="#recipe{position()}">
                <xsl:value-of select="r:title" />
            </a>

        </li>
    </xsl:template>
    
    <xsl:template match="r:recipe">
        <div>
            <hr/>
            <a name="recipe{position()}" id="recipe{position()}"/>
            <h3>
                <xsl:value-of select="r:title"/>
            </h3>
            <xsl:call-template name="detail" />
        </div>
    </xsl:template>
    
    <xsl:template match="r:ingredient">
        <li>
            <strong>
                <xsl:value-of select="@name"/>
            </strong>
            <xsl:text>:  </xsl:text>
            <xsl:value-of select="@amount"/>
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="@unit"/>
        </li>
        <xsl:call-template name="detail" />
            
    </xsl:template>
    <xsl:template match="r:step">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
    
    <xsl:template name="detail">
        <xsl:if test="r:ingredient">
            <h4>Ingredients</h4>
            <ul>
                <xsl:apply-templates select="r:ingredient" />
            </ul>
        </xsl:if>
        <xsl:if test="r:preparation">
            <h4>Preparation</h4>
            <ol>
                <xsl:apply-templates select="r:preparation/r:step"/>
            </ol>
        </xsl:if>
    </xsl:template>
    
    <!-- 
     Please complete the stylesheet.
     For instructions, read the comments in XSLTProcesor.java
    -->
</xsl:stylesheet>
