package demo

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class DeviceAssignmentSpec extends Specification implements DomainUnitTest<DeviceAssignment> {

     void "test domain constraints"() {
        when:
        DeviceAssignment domain = new DeviceAssignment()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
