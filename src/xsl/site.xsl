<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--<xsl:include href="../common/xsl/startnav.xsl"/>-->
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/site">
<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="icon" href="../../favicon.ico"/>
    <title>Narrow Jumbotron Template for Bootstrap</title>
    <link rel="stylesheet" href="assets/bootstrap-4.0.0-alpha.6-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/server-mechanic.css"/>
  </head>

  <body>

    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills float-right">
            <xsl:for-each select="pages/page">
            <li class="nav-item">
              <a>
              <xsl:if test="./@path=$page">
              <xsl:attribute name="class">nav-link active</xsl:attribute>
              </xsl:if>
              <xsl:if test="./@path!=$page">
              <xsl:attribute name="class">nav-link</xsl:attribute>
              </xsl:if>
              <xsl:attribute name="href"><xsl:value-of select="./@path"/>.html</xsl:attribute>
              <xsl:value-of select="@short-title"/>
              </a>
            </li>
<!--
            <li class="nav-item">
              <a class="nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
-->
            </xsl:for-each>
          </ul>
        </nav>
	<img src="assets/images/mechanic_small.png"/><h3 class="text-muted">Server Mechanic</h3>
      </div>

      <xsl:apply-templates select="pages/page[@path=$page]"/>

      <footer class="footer">
        <p>Company 2017</p>
      </footer>

    </div> <!-- /container -->

    <script src="/assets/bootstrap-4.0.0-alpha.6-dist/bootstrap.min.js"></script>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
</xsl:template>

<xsl:template match="page">
      <xsl:value-of select="$page"/>
      <xsl:variable name="page-layout" select="pages/pages[@path=$page]/@layout"/>
      LAYOUT:[<xsl:value-of select="$page-layout"/>]
<xsl:apply-templates select="*"/>

</xsl:template>

<xsl:include href="./identity.xsl"/>
</xsl:stylesheet>
