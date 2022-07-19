# frozen_string_literal: true

module ApplicationHelper
  def nav_link_to(text, path)
    link_to text, path, class: 'group grid gap-x-2 gap-y-1 grid-cols-1 lg:grid-cols-auto-span items-center justify-items-center lg:justify-items-start mx-1 px-3 py-2 rounded-lg bg-transparent hover:bg-[#25263D] focus:bg-[#25263D] whitespace-nowrap'
  end
end
