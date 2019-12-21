String get getGiftsQuery => """
      query gifts {
        gift {
          id
          name
          image_url
          created_at
          account {
            name
            image_url
          }
        }
      }
    """;
