require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @event_params = {
      title: 'Test Event',
      description: 'This is a test event',
      category: 'Test Category',
    }
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test 'should show event' do
    event = Event.create!(@event_params)
    get :show, params: { id: event.id }
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create event' do
    assert_difference('Event.count') do
      post :create, params: { event: @event_params }
    end

    assert_redirected_to event_path(assigns(:event))
    assert_equal 'Event was successfully created.', flash[:notice]
  end

  test 'should not create event with invalid params' do
    @event_params[:title] = nil  # Make the params invalid

    assert_no_difference('Event.count') do
      post :create, params: { event: @event_params }
    end

    assert_template :new
  end

  test 'should get edit' do
    event = Event.create!(@event_params)
    get :edit, params: { id: event.id }
    assert_response :success
  end

  test 'should update event' do
    event = Event.create!(@event_params)
    updated_title = 'Updated Event'
    patch :update, params: { id: event.id, event: { title: updated_title } }
    assert_redirected_to event_path(assigns(:event))
    assert_equal 'Event was successfully updated.', flash[:notice]
    event.reload
    assert_equal updated_title, event.title
  end

  test 'should destroy event' do
    event = Event.create!(@event_params)
    assert_difference('Event.count', -1) do
      delete :destroy, params: { id: event.id }
    end

    assert_redirected_to events_path
    assert_equal 'Event was successfully destroyed.', flash[:notice]
  end
end
