{
  parameters: {
    script: [
      "# Import Streamlit library\nimport streamlit as st\n\n# This is the main function where we define our web app\ndef main():\n    # Adding a title to the web app\n    st.title('Hello World Streamlit Web App')\n\n    # Writing a simple text to introduce the app\n    st.write(\"This is a basic Streamlit web app that demonstrates some of the popular widgets and components.\")\n\n    # Explaining Streamlit's caching mechanism to optimize data loading/performance\n    st.subheader(\"Streamlit's Caching\")\n    st.write(\n        \"\"\"\n        Streamlit provides a caching mechanism that helps in speeding up the app by storing \n        the computation outputs in cache. This is extremely useful when dealing with \n        heavy computations or loading large datasets.\n        \"\"\"\n    )\n    \n    # Example function to simulate a heavy computation or data loading\n    @st.cache_data\n    def load_data():\n        # Simulating a heavy computation or data loading process\n        import time\n        time.sleep(2)  # Simulating delay\n        return [i ** 2 for i in range(1000)]\n\n    # Call the cached function and display the result\n    if st.button('Load Data'):\n        data = load_data()\n        st.write(data)\n\n    # Streamlit widgets\n    st.subheader('Streamlit Widgets')\n    st.write(\"Streamlit offers various widgets that can be used to create interactive apps.\")\n\n    # Using a text input widget\n    name = st.text_input(\"Enter your name:\")\n    if name:\n        st.write(f\"Hello, {name}!\")\n\n    # Using a slider widget\n    age = st.slider(\"Select your age\", 0, 100, 25)\n    st.write(\"Your age is:\", age)\n\n    # Using a selectbox widget\n    favorite_color = st.selectbox(\n        \"Choose your favorite color\",\n        ('Blue', 'Green', 'Red')\n    )\n    st.write(f\"Your favorite color is {favorite_color}.\")\n\n    # Using a checkbox to show/hide information\n    if st.checkbox('Show details'):\n        st.write(\"You are exploring a basic Streamlit app. Keep going to discover more!\")\n\n    # Using a file uploader to allow users to upload files\n    uploaded_file = st.file_uploader(\"Choose a file\")\n    if uploaded_file is not None:\n        st.write(\"File uploaded successfully!\")\n\n    # Using columns to layout widgets side by side\n    col1, col2 = st.columns(2)\n    with col1:\n        st.write(\"Column 1\")\n        st.button(\"Click me!\")\n    with col2:\n        st.write(\"Column 2\")\n        st.button(\"No, click me!\")\n\n# Python typical boilerplate to execute the main function\nif __name__ == \"__main__\":\n    main()\n",
    ],
    dataApp: {
      streamlitAuthEnabled: false,
    },
  },
  authorization: {
    app_proxy: {
      auth_providers: [],
      auth_rules: [
        {
          type: "pathPrefix",
          value: "/",
          auth_required: false,
        },
      ],
    },
  },
}
