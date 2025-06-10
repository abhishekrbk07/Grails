package demo

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class DeviceSpec extends Specification implements DomainUnitTest<Device> {

     void "test domain constraints"() {
        when:
        Device domain = new Device()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
