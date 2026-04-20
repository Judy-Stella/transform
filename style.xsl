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
					font-family: "Segoe UI", Arial, sans-serif;
					margin: 0;
					padding: 40px 20px;
					background: linear-gradient(135deg, #eef2ff, #f8fafc);
					color: #1e293b;
					}

					.container {
					max-width: 1100px;
					margin: 0 auto;
					}

					h1 {
					text-align: center;
					font-size: 2.4em;
					margin-bottom: 10px;
					color: #0f172a;
					}

					.subtitle {
					text-align: center;
					color: #64748b;
					font-size: 1.05em;
					margin-bottom: 35px;
					}

					.badge {
					background: #ffffff;
					border-radius: 18px;
					padding: 22px;
					margin-bottom: 24px;
					box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
					border: 1px solid #e2e8f0;
					transition: 0.3s ease;
					}

					.badge:hover {
					transform: translateY(-3px);
					box-shadow: 0 14px 34px rgba(15, 23, 42, 0.12);
					}

					.b-name {
					font-size: 1.4em;
					font-weight: 700;
					color: #2563eb;
					margin: 0 0 8px 0;
					}

					.b-desc {
					color: #475569;
					font-size: 1em;
					line-height: 1.6;
					margin: 0 0 16px 0;
					}

					table {
					width: 100%;
					border-collapse: collapse;
					overflow: hidden;
					border-radius: 12px;
					background: #f8fafc;
					}

					th {
					background: #2563eb;
					color: white;
					text-align: left;
					padding: 12px 14px;
					font-size: 0.95em;
					letter-spacing: 0.3px;
					}

					td {
					padding: 12px 14px;
					border-bottom: 1px solid #e2e8f0;
					font-size: 0.96em;
					}

					tr:last-child td {
					border-bottom: none;
					}

					.section-name {
					font-weight: 600;
					color: #0f172a;
					}

					.yes {
					display: inline-block;
					padding: 6px 12px;
					border-radius: 999px;
					background: #dcfce7;
					color: #166534;
					font-weight: 600;
					font-size: 0.92em;
					}

					.no {
					display: inline-block;
					padding: 6px 12px;
					border-radius: 999px;
					background: #fee2e2;
					color: #991b1b;
					font-weight: 600;
					font-size: 0.92em;
					}

					footer {
					text-align: center;
					margin-top: 35px;
					color: #64748b;
					font-size: 0.92em;
					}
				</style>
			</head>

			<body>
				<div class="container">
					<h1>Scout Activity Badges</h1>
					<p class="subtitle">Modern styled badge list with section availability</p>

					<xsl:for-each select="badges/badge[@type='activity']">
						<xsl:sort select="name" data-type="text" order="ascending"/>

						<div class="badge">
							<p class="b-name">
								<xsl:value-of select="name"/>
							</p>
							<p class="b-desc">
								<xsl:value-of select="description"/>
							</p>

							<table>
								<tr>
									<th>Section</th>
									<th>Availability</th>
								</tr>

								<xsl:for-each select="levels/availability">
									<tr>
										<td class="section-name">
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
