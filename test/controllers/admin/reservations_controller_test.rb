require 'test_helper'

class Admin::ReservationsControllerTest < ActionController::TestCase
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post :create, reservation: { calendar_id: @reservation.calendar_id, cover: @reservation.cover, final_time: @reservation.final_time, max_participants: @reservation.max_participants, starts_at: @reservation.starts_at }
    end

    assert_redirected_to admin_reservation_path(assigns(:reservation))
  end

  test "should show reservation" do
    get :show, id: @reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation
    assert_response :success
  end

  test "should update reservation" do
    patch :update, id: @reservation, reservation: { calendar_id: @reservation.calendar_id, cover: @reservation.cover, final_time: @reservation.final_time, max_participants: @reservation.max_participants, starts_at: @reservation.starts_at }
    assert_redirected_to admin_reservation_path(assigns(:reservation))
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete :destroy, id: @reservation
    end

    assert_redirected_to admin_reservations_path
  end
end
