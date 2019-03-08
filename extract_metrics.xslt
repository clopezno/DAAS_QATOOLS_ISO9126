<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
        <head>
            <style>
                body {
                    font-family: verdana, arial, sans-serif;
                }
                table {
                    border: 1px solid;
                    border-spacing: 0;
                    font-size: small;
                }
                th, td {
                    border: 1px solid;
                    vertical-align: top;
                    padding: 4px;
                }
                .disabled {
                    color: silver;
                }
            </style>
        </head>
        <body>
            <h2>Métricas</h2>
            <details>
                <summary>Todas</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Calculada para</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                        <xsl:attribute name="class">
                                            disabled
                                        </xsl:attribute>
                                    </xsl:if>
                                    <td><xsl:value-of select="@name" /></td>
                                    <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                    <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                    <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                    <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                    <td>
                                        <ul>
                                            <xsl:for-each select="attribute[@name='Calculated']/attribute[@name='CalculatedFor']">
                                                <li><xsl:value-of select="@value" /></li>
                                            </xsl:for-each>
                                        </ul>
                                    </td>
                                    <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            <!-- File -->
            <details>
                <summary>Ficheros</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="attribute[@name='Calculated']/attribute[@name='CalculatedFor'][@value='File']">
                                    <tr>
                                        <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                            <xsl:attribute name="class">
                                                disabled
                                            </xsl:attribute>
                                        </xsl:if>
                                        <td><xsl:value-of select="@name" /></td>
                                        <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                    </tr>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            <!-- Component -->
            <details>
                <summary>Componentes</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="attribute[@name='Calculated']/attribute[@name='CalculatedFor'][@value='Component']">
                                    <tr>
                                        <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                            <xsl:attribute name="class">
                                                disabled
                                            </xsl:attribute>
                                        </xsl:if>
                                        <td><xsl:value-of select="@name" /></td>
                                        <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                    </tr>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            <!-- Package -->
            <details>
                <summary>Paquetes</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="attribute[@name='Calculated']/attribute[@name='CalculatedFor'][@value='Package']">
                                    <tr>
                                        <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                            <xsl:attribute name="class">
                                                disabled
                                            </xsl:attribute>
                                        </xsl:if>
                                        <td><xsl:value-of select="@name" /></td>
                                        <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                    </tr>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            <!-- Class -->
            <details>
                <summary>Clases</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="attribute[@name='Calculated']/attribute[@name='CalculatedFor'][@value='Class']">
                                    <tr>
                                        <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                            <xsl:attribute name="class">
                                                disabled
                                            </xsl:attribute>
                                        </xsl:if>
                                        <td><xsl:value-of select="@name" /></td>
                                        <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                    </tr>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            <!-- Interface -->
            <details>
                <summary>Interfaces</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="attribute[@name='Calculated']/attribute[@name='CalculatedFor'][@value='Interface']">
                                    <tr>
                                        <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                            <xsl:attribute name="class">
                                                disabled
                                            </xsl:attribute>
                                        </xsl:if>
                                        <td><xsl:value-of select="@name" /></td>
                                        <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                    </tr>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            <!-- Annotation -->
            <details>
                <summary>Anotaciones</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="attribute[@name='Calculated']/attribute[@name='CalculatedFor'][@value='Annotation']">
                                    <tr>
                                        <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                            <xsl:attribute name="class">
                                                disabled
                                            </xsl:attribute>
                                        </xsl:if>
                                        <td><xsl:value-of select="@name" /></td>
                                        <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                    </tr>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            <!-- Enum -->
            <details>
                <summary>Enumeraciones</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="attribute[@name='Calculated']/attribute[@name='CalculatedFor'][@value='Enum']">
                                    <tr>
                                        <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                            <xsl:attribute name="class">
                                                disabled
                                            </xsl:attribute>
                                        </xsl:if>
                                        <td><xsl:value-of select="@name" /></td>
                                        <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                    </tr>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            <!-- Method -->
            <details>
                <summary>Métodos</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="attribute[@name='Calculated']/attribute[@name='CalculatedFor'][@value='Method']">
                                    <tr>
                                        <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                            <xsl:attribute name="class">
                                                disabled
                                            </xsl:attribute>
                                        </xsl:if>
                                        <td><xsl:value-of select="@name" /></td>
                                        <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                    </tr>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            <!-- CloneClass -->
            <!--
            <details>
                <summary>CloneClasses</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="attribute[@name='Calculated']/attribute[@name='CalculatedFor'][@value='CloneClass']">
                                    <tr>
                                        <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                            <xsl:attribute name="class">
                                                disabled
                                            </xsl:attribute>
                                        </xsl:if>
                                        <td><xsl:value-of select="@name" /></td>
                                        <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                    </tr>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            -->
            <!-- CloneInstance -->
            <!--
            <details>
                <summary>CloneInstances</summary>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Prioridad</th>
                        <th>Ayuda</th>
                        <th>Habilitada</th>
                    </tr>
                    <xsl:for-each select="graph/data/node[@type='RulMetric']">
                        <xsl:choose>
                            <xsl:when test="attribute[@name='Settings']/attribute[@name='metricName']/@value != '' or (attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value = 'Info'">
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="attribute[@name='Calculated']/attribute[@name='CalculatedFor'][@value='CloneInstance']">
                                    <tr>
                                        <xsl:if test="(attribute[@name='Enabled'])[1]/@value = 'false'">
                                            <xsl:attribute name="class">
                                                disabled
                                            </xsl:attribute>
                                        </xsl:if>
                                        <td><xsl:value-of select="@name" /></td>
                                        <td><xsl:value-of select="(attribute[@name='DisplayName'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Description'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Settings']/attribute[@name='Priority'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='HelpText'])[1]/@value" disable-output-escaping="yes" /></td>
                                        <td><xsl:value-of select="(attribute[@name='Enabled'])[1]/@value" disable-output-escaping="yes" /></td>
                                    </tr>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </details>
            -->
            <h2>Umbrales</h2>
            <table>
                <tr>
                    <th>ID Métrica</th>
                    <th>Relación</th>
                    <th>Umbral</th>
                    <th>Calculada para</th>
                </tr>
                <xsl:for-each select="graph/data/node[@type='RulMetric']">
                    <xsl:if test="attribute[@name='Settings']/attribute[@name='metricName']">
                        <tr>
                            <td><xsl:value-of select="attribute[@name='Settings']/attribute[@name='metricName']/@value" /></td>
                            <td><xsl:value-of select="attribute[@name='Settings']/attribute[@name='relation']/@value" /></td>
                            <td><xsl:value-of select="attribute[@name='Settings']/attribute[@name='threshold']/@value" /></td>
                            <td><xsl:value-of select="attribute[@name='Calculated']/attribute[@name='CalculatedFor']/@value" /></td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </table>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>