# TWO-TIER ARCHITECTURE

A Two-Tier Architecture splits an application into two separate layers: a web/application tier that users interact with, and a database tier that stores the data, Each tier has it's own job and communicates with the other over a netwrok connection.

# The Web/Application Tier

- Serve the user interface (web pages, dashboards, file browsers)
- Receive the handle HTTP requests from users' browsers
- Run the application logic (login, file uploads, sharing)
- Query the database tier whenever it needs to read or save data

  # The Database Tier

  - Store persistent data such as user accounts, file metadata, and  settings
  -  Respond to queries from the application tier
  -  Keep data organized, consistent, and safe

    # Why separate them?

  Separating the web server and the database into two containers lets each one be updated, restarted, scaled, or troubleshot independently, so a problem in one does not take down the other. It also improves security, because the database can be kept hidden from the outside world while only the web tier is exposed. Each container can be sized and tuned for its own workload instead of forcing one container to do everything.
