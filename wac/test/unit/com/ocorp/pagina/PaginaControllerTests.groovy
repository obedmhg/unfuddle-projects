package com.ocorp.pagina



import org.junit.*
import grails.test.mixin.*

@TestFor(PaginaController)
@Mock(Pagina)
class PaginaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pagina/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.paginaInstanceList.size() == 0
        assert model.paginaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.paginaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.paginaInstance != null
        assert view == '/pagina/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pagina/show/1'
        assert controller.flash.message != null
        assert Pagina.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pagina/list'


        populateValidParams(params)
        def pagina = new Pagina(params)

        assert pagina.save() != null

        params.id = pagina.id

        def model = controller.show()

        assert model.paginaInstance == pagina
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pagina/list'


        populateValidParams(params)
        def pagina = new Pagina(params)

        assert pagina.save() != null

        params.id = pagina.id

        def model = controller.edit()

        assert model.paginaInstance == pagina
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pagina/list'

        response.reset()


        populateValidParams(params)
        def pagina = new Pagina(params)

        assert pagina.save() != null

        // test invalid parameters in update
        params.id = pagina.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pagina/edit"
        assert model.paginaInstance != null

        pagina.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pagina/show/$pagina.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pagina.clearErrors()

        populateValidParams(params)
        params.id = pagina.id
        params.version = -1
        controller.update()

        assert view == "/pagina/edit"
        assert model.paginaInstance != null
        assert model.paginaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pagina/list'

        response.reset()

        populateValidParams(params)
        def pagina = new Pagina(params)

        assert pagina.save() != null
        assert Pagina.count() == 1

        params.id = pagina.id

        controller.delete()

        assert Pagina.count() == 0
        assert Pagina.get(pagina.id) == null
        assert response.redirectedUrl == '/pagina/list'
    }
}
