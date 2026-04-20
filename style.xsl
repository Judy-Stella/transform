<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>

  <xsl:template match="badges">
    <h1>Activity Badges</h1>
    <xsl:apply-templates select="badge[@type='activity']">
      <xsl:sort order="ascending" select="name"/>
    </xsl:apply-templates>
    <p><i>&#xA9; College Productions Ltd</i></p>
  </xsl:template>

  <xsl:template match="badge">
    <h2><xsl:value-of select="name"/></h2>
    <p><xsl:value-of select="description"/></p>
    <xsl:apply-templates select="levels"/>
  </xsl:template>

  <xsl:template match="levels">
    <xsl:apply-templates select="availability"/>
  </xsl:template>

  <xsl:template match="availability">
    <p>
      <xsl:choose>
        <xsl:when test="@level = 'beaver'">Beaver: </xsl:when>
        <xsl:when test="@level = 'scout'">Scout: </xsl:when>
        <xsl:otherwise>Cub: </xsl:otherwise>
      </xsl:choose>
      <xsl:value-of select="."/>
    </p>
  </xsl:template>

</xsl:stylesheet>
