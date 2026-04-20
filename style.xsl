<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Scout Activity Badges</title>

        <style type="text/css">
          body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #0f172a, #020617);
            color: #e2e8f0;
            padding: 40px;
          }

          h1 {
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 10px;
            background: linear-gradient(90deg, #38bdf8, #c084fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
          }

          .container {
            max-width: 1100px;
            margin: auto;
          }

          .badge {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 18px;
            padding: 20px;
            margin-bottom: 25px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.5);
            border: 1px solid rgba(255,255,255,0.1);
            transition: 0.3s;
          }

          .badge:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.6);
          }

          .b-name {
            font-size: 1.4em;
            font-weight: bold;
            margin-bottom: 5px;
            color: #f8fafc;
          }

          .b-desc {
            font-size: 0.95em;
            color: #94a3b8;
            margin-bottom: 15px;
          }

          table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
          }

          th {
            background: rgba(56, 189, 248, 0.2);
            color: #38bdf8;
            text-align: left;
            padding: 10px;
            font-size: 0.9em;
          }

          td {
            padding: 10px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            font-size: 0.9em;
          }

          tr:last-child td {
            border-bottom: none;
          }

          .yes {
            color: #4ade80;
            font-weight: bold;
          }

          .no {
            color: #f87171;
            font-weight: bold;
          }

          footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9em;
            color: #64748b;
          }

        </style>
      </head>

      <body>
        <div class="container">
          <h1>Scout Activity Badges</h1>

          <xsl:for-each select="badges/badge[@type='activity']">
            <xsl:sort select="name" order="ascending"/>

            <div class="badge">
              <p class="b-name"><xsl:value-of select="name"/></p>
              <p class="b-desc"><xsl:value-of select="description"/></p>

              <table>
                <tr>
                  <th>Section</th>
                  <th>Availability</th>
                </tr>

                <xsl:for-each select="levels/availability">
                  <tr>
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

          <footer>
            <p>&#xA9; 2026 College Productions Ltd &#x2014; All rights reserved.</p>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
