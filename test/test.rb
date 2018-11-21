require "./src/weather/WeatherReporter.rb"
require "minitest/autorun"
require "yaml"

class TestWeather < MiniTest::Test
    def setup
        config = YAML.load_file './b/secrets.yml'
        @reporter = WeatherReporter.new config['OWM_API']
    end

    def test_can_test_stuff
        assert @reporter.say_the_truth
    end

    # def test_first_song
    #     assert_empty @jukebox.play_nth_song 0
    # end

    # def test_play_many_songs
    #     assert_empty @jukebox.play_nth_song 0
    #     assert_empty @jukebox.play_nth_song 1
    # end

    # def test_try_to_play_invalid_index
    #     assert_raises(IndexError) do
    #         @jukebox.play_nth_song -1
    #     end
    # end

    # def test_try_to_play_a_playlist
    #     @jukebox = Jukebox.new 'test/testmusic'
    #     @jukebox.add_to_playlist 0
    #     @jukebox.play_all_songs
    #     assert @jukebox.playlist
    #     @jukebox.add_to_playlist 1
    # end
end