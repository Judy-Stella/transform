<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <!-- ================================================================
       Single root template: builds the whole HTML document in one go.
       (The sample solution uses four separate templates with
       apply-templates; this stylesheet uses for-each instead to keep
       the logic in one place.)
       ================================================================ -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Scout Activity Badges</title>
        <style type="text/css">
          body      { font-family: Arial, Helvetica, sans-serif;
                      margin: 30px; background:#f7f7f2; color:#222; }
          h1        { color:#2d6a4f; border-bottom:3px solid #2d6a4f;
                      padding-bottom:6px; }
          .badge    { background:#ffffff; border:1px solid #c9d6c1;
                      border-radius:6px; padding:14px 18px;
                      margin-bottom:18px;
                      box-shadow:2px 2px 4px rgba(0,0,0,0.05); }
          .b-name   { font-size:1.2em; font-weight:bold;
                      color:#1b4332; margin:0 0 4px 0; }
          .b-desc   { font-style:italic; color:#555; margin:0 0 10px 0; }
          table     { border-collapse:collapse; width:60%; }
          th, td    { border:1px solid #aaa; padding:6px 10px;
                      text-align:left; }
          th        { background:#d8f3dc; color:#1b4332; }
          .yes      { color:#2d6a4f; font-weight:bold; }
          .no       { color:#9d0208; }
          footer    { margin-top:30px; text-align:center;
                      color:#666; font-size:0.9em;
                      border-top:1px solid #ccc; padding-top:8px; }
        </style>
      </head>

      <body>
        <h1>Scout Activity Badges</h1>

        <!-- Filter (only type='activity') + alphabetical sort,
             all inside ONE for-each loop. -->
        <xsl:for-each select="badges/badge[@type='activity']">
          <xsl:sort select="name" data-type="text" order="ascending"/>

          <div class="badge">
            <p class="b-name"><xsl:value-of select="name"/></p>
            <p class="b-desc"><xsl:value-of select="description"/></p>

            <table>
              <tr>
                <th>Section</th>
                <th>Availability</th>
              </tr>

              <!-- Inner loop over <availability> elements -->
              <xsl:for-each select="levels/availability">
                <tr>
                  <!-- xsl:choose #1: map the level attribute to a
                       nicely-capitalised section name -->
                  <td>
                    <xsl:choose>
                      <xsl:when test="@level='beaver'">Beaver</xsl:when>
                      <xsl:when test="@level='cub'">Cub</xsl:when>
                      <xsl:when test="@level='scout'">Scout</xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="@level"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>

                  <!-- xsl:choose #2: colour the text depending on
                       whether the badge is Available or Not Available -->
                  <td>
                    <xsl:choose>
                      <xsl:when test=". = 'Available'">
                        <span class="yes">&#x2714; Available</span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span class="no">&#x2718; Not Available</span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </xsl:for-each>
            </table>
          </div>
        </xsl:for-each>

        <!-- Copyright notice using XHTML character entities
             (&#xA9; = ©, &#x2014; = —) -->
        <footer>
          <p>
            &#xA9; 2026 College Productions Ltd &#x2014;
            All rights reserved.
          </p>
        </footer>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
