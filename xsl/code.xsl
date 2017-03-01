<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="code">
  <pre class="code">
    <xsl:apply-templates select="@*|node()"/>
  </pre>
</xsl:template>

</xsl:stylesheet>
