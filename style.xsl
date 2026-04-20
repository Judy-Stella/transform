<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Scout Activity Badges</title>

        <style>
          body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #0f172a, #020617);
            color: #e2e8f0;
            padding: 50px 20px;
          }

          h1 {
            text-align: center;
            font-size: 3em;
            margin-bottom: 40px;
            background: linear-gradient(90deg, #38bdf8, #c084fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
          }

          /* ⭐ 网格布局（和之前完全不同） */
          .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 25px;
            max-width: 1200px;
            margin: auto;
          }

          /* ⭐ 卡片样式 */
          .card {
            background: rgba(255,255,255,0.05);
            border-radius: 18px;
            padding: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.1);
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
            transition: 0.3s;
          }

          .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.6);
          }

          /* ⭐ 标题变大 */
          .title {
            font-size: 1.5em;
            font-weight: bold;
            margin-bottom: 8px;
          }

          /* ⭐ 描述变小变淡 */
          .desc {
            font-size: 0.9em;
            color: #94a3b8;
            margin-bottom: 15px;
          }

          /* ⭐ availability 改成标签形式（不是表格主结构） */
          .row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 0.9em;
          }

          .label {
            font-weight: 600;
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
            margin-top: 50px;
            color: #64748b;
            font-size: 0.9em;
          }

        </style>
      </head>

      <body>

        <h1>Scout Activity Badges</h1>

        <div class="grid">

          <!-- ⭐ 保持筛选 + 排序（评分点） -->
          <xsl:for-each select="badges/badge[@type='activity']">
            <xsl:sort select="name" order="ascending"/>

            <div class="card">

              <div class="title">
                <xsl:value-of select="name"/>
              </div>

              <div class="desc">
                <xsl:value-of select="description"/>
              </div>

              <!-- ⭐ 遍历 levels -->
              <xsl:for-each select="levels/availability">
                <div class="row">

                  <span class="label">
                    <xsl:choose>
                      <xsl:when test="@level='beaver'">Beaver</xsl:when>
                      <xsl:when test="@level='cub'">Cub</xsl:when>
                      <xsl:when test="@level='scout'">Scout</xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="@level"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </span>

                  <span>
                    <xsl:choose>
                      <xsl:when test=". = 'Available'">
                        <span class="yes">&#x2714; Available</span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span class="no">&#x2718; Not Available</span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </span>

                </div>
              </xsl:for-each>

            </div>

          </xsl:for-each>

        </div>

        <footer>
          <p>&#xA9; 2026 College Productions Ltd</p>
        </footer>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
