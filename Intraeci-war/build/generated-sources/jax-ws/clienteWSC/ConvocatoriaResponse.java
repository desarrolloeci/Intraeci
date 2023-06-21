
package clienteWSC;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para anonymous complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="_ConvocatoriaResult" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "convocatoriaResult"
})
@XmlRootElement(name = "_ConvocatoriaResponse")
public class ConvocatoriaResponse {

    @XmlElement(name = "_ConvocatoriaResult")
    protected int convocatoriaResult;

    /**
     * Obtiene el valor de la propiedad convocatoriaResult.
     * 
     */
    public int getConvocatoriaResult() {
        return convocatoriaResult;
    }

    /**
     * Define el valor de la propiedad convocatoriaResult.
     * 
     */
    public void setConvocatoriaResult(int value) {
        this.convocatoriaResult = value;
    }

}
