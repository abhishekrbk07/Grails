package org

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class EmployeeControllerControllerSpec extends Specification implements ControllerUnitTest<EmployeeControllerController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
