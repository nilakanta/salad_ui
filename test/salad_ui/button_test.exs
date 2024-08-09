defmodule SaladUI.ButtonTest do
  use ComponentCase

  import SaladUI.Button

  describe "Test Button" do
    test "It renders default button correctly" do
      assigns = %{}

      html =
        rendered_to_string(~H"""
        <.button>Send!</.button>
        """)

      assert html =~ "Send!"
      assert html =~ "<button class=\"inline-flex"

      for class <-
            ~w(inline-flex px-4 py-2 rounded-md ring-offset-background bg-primary text-primary-foreground transition-colors whitespace-nowrap items-center justify-center font-medium text-sm h-10 disabled:pointer-events-none disabled:opacity-50 focus-visible:ring-ring focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 hover:bg-primary/90) do
        assert html =~ class
      end
    end

    test "It renders button with additional css class correctly" do
      assigns = %{}

      html =
        rendered_to_string(~H"""
        <.button phx-click="go" class="ml-2-additional-class">Send!</.button>
        """)

      assert html =~ "Send!"
      assert html =~ "phx-click=\"go\""
      assert html =~ "ml-2-additional-class"
    end

    test "It renders destructive button correctly" do
      assigns = %{}

      html =
        rendered_to_string(~H"""
        <.button phx-click="go" variant="destructive">Destructive act!</.button>
        """)

      assert html =~ "phx-click=\"go\""
      assert html =~ "Destructive act"

      for class <- ~w(inline-flex px-4 py-2 rounded-md ring-offset-background bg-destructive text-destructive-foreground transition-colors whitespace-nowrap items-center justify-center font-medium text-sm h-10 disabled:pointer-events-none disabled:opacity-50 focus-visible:ring-ring focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 hover:bg-destructive/90) do
        assert html =~ class
      end
    end

    test "It renders outline button correctly" do
      assigns = %{}

      html =
        rendered_to_string(~H"""
        <.button phx-click="go" variant="outline">Outline act!</.button>
        """)

      assert html =~ "phx-click=\"go\""
      assert html =~ "Outline act"

      for class <- ~w(inline-flex px-4 py-2 rounded-md ring-offset-background border-input bg-background transition-colors whitespace-nowrap items-center justify-center font-medium text-sm h-10 disabled:pointer-events-none disabled:opacity-50 focus-visible:ring-ring focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 hover:bg-accent hover:text-accent-foreground border) do
        assert html =~ class
      end
    end

    test "It renders secondary button correctly" do
      assigns = %{}

      html =
        rendered_to_string(~H"""
        <.button phx-click="go" variant="secondary">secondary act!</.button>
        """)

      assert html =~ "phx-click=\"go\""
      assert html =~ "secondary act"

      for class <- ~w(inline-flex px-4 py-2 rounded-md ring-offset-background bg-secondary text-secondary-foreground transition-colors whitespace-nowrap items-center justify-center font-medium text-sm h-10 disabled:pointer-events-none disabled:opacity-50 focus-visible:ring-ring focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-offset-2 hover:bg-secondary/80) do
        assert html =~ class
      end
    end

    test "It renders ghost button correctly" do
      assigns = %{}

      html =
        rendered_to_string(~H"""
        <.button phx-click="go" variant="ghost">ghost act!</.button>
        """)

      assert html =~ "phx-click=\"go\""
      assert html =~ "ghost act"

      for class <- ~w(hover:bg-accent hover:text-accent-foreground) do
        assert html =~ class
      end
    end

    test "It renders link button correctly" do
      assigns = %{}

      html =
        rendered_to_string(~H"""
        <.button phx-click="go" variant="link">link act!</.button>
        """)

      assert html =~ "phx-click=\"go\""
      assert html =~ "link act"

      for class <- ~w(text-primary underline-offset-4 hover:underline) do
        assert html =~ class
      end
    end
  end
end
