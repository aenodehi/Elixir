defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, number: 0, form: to_form(%{adding_amount_default: 0}))}
  end

  # def render(assigns) do
  #   ~H"""

  #   """

  # end

  def handle_event("add", _params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number + 1)}
  end

  def handle_event("adding_more", %{"add_amount" => the_added_amount}, socket) do
    amount_to_add_by = case Integer.parse(the_added_amount) do
      {number, _} -> number
      :error -> 0
    end

    {:noreply, assign(socket, number: socket.assigns.number + amount_to_add_by, form: to_form(%{adding_amount_default: the_added_amount}))}
  end

end
