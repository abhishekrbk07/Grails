package demo

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class EmployeeControllerSpec extends Specification implements ControllerUnitTest<EmployeeController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
