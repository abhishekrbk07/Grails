package demo

class  DeviceEntry {
    String name

    static constraints = {
        name nullable: false, inList: ['Laptop', 'Monitor', 'Headphone', 'Mouse']
    }
}
