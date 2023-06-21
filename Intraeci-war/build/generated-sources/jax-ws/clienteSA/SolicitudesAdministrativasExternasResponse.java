
package clienteSA;

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
 *         &lt;element name="_SolicitudesAdministrativasExternasResult" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
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
    "solicitudesAdministrativasExternasResult"
})
@XmlRootElement(name = "_SolicitudesAdministrativasExternasResponse")
public class SolicitudesAdministrativasExternasResponse {

    @XmlElement(name = "_SolicitudesAdministrativasExternasResult")
    protected int solicitudesAdministrativasExternasResult;

    /**
     * Obtiene el valor de la propiedad solicitudesAdministrativasExternasResult.
     * 
     */
    public int getSolicitudesAdministrativasExternasResult() {
        return solicitudesAdministrativasExternasResult;
    }

    /**
     * Define el valor de la propiedad solicitudesAdministrativasExternasResult.
     * 
     */
    public void setSolicitudesAdministrativasExternasResult(int value) {
        this.solicitudesAdministrativasExternasResult = value;
    }

}
