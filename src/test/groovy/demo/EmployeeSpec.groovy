package demo

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class EmployeeSpec extends Specification implements DomainUnitTest<Employee> {

     void "test domain constraints"() {
        when:
        Employee domain = new Employee()
        //TODO: Set domain props here

        then:
        domain.validate()
     }
}
