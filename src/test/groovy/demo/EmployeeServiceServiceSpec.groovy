package demo

import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class EmployeeServiceSpec extends Specification implements ServiceUnitTest<EmployeeService> {

     void "test something"() {
        expect:
        service.doSomething()
     }
}
