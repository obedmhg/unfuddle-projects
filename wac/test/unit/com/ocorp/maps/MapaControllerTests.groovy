package com.ocorp.maps



import org.junit.*
import grails.test.mixin.*

@TestFor(MapaController)
@Mock(Mapa)
class MapaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mapa/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mapaInstanceList.size() == 0
        assert model.mapaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.mapaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mapaInstance != null
        assert view == '/mapa/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mapa/show/1'
        assert controller.flash.message != null
        assert Mapa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mapa/list'


        populateValidParams(params)
        def mapa = new Mapa(params)

        assert mapa.save() != null

        params.id = mapa.id

        def model = controller.show()

        assert model.mapaInstance == mapa
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mapa/list'


        populateValidParams(params)
        def mapa = new Mapa(params)

        assert mapa.save() != null

        params.id = mapa.id

        def model = controller.edit()

        assert model.mapaInstance == mapa
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mapa/list'

        response.reset()


        populateValidParams(params)
        def mapa = new Mapa(params)

        assert mapa.save() != null

        // test invalid parameters in update
        params.id = mapa.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mapa/edit"
        assert model.mapaInstance != null

        mapa.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mapa/show/$mapa.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mapa.clearErrors()

        populateValidParams(params)
        params.id = mapa.id
        params.version = -1
        controller.update()

        assert view == "/mapa/edit"
        assert model.mapaInstance != null
        assert model.mapaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mapa/list'

        response.reset()

        populateValidParams(params)
        def mapa = new Mapa(params)

        assert mapa.save() != null
        assert Mapa.count() == 1

        params.id = mapa.id

        controller.delete()

        assert Mapa.count() == 0
        assert Mapa.get(mapa.id) == null
        assert response.redirectedUrl == '/mapa/list'
    }
}
