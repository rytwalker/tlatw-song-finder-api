const Track = require("../models/Track");
const {
  filterTempo,
  filterKey,
  filterMode,
  addAudioFeature,
  scoreSort,
} = require("../helpers/searchHelpers");

class SearchController {
  static async query(req, res) {
    try {
      const {
        energy,
        danceability,
        instrumentalness,
        happiness,
        acousticness,
        tempo,
        mode,
        keys,
      } = req.body;

      const tracks = await Track.find();

      // FILTERS
      const filteredTracks = tracks
        .filter((track) => filterTempo(track.tempo, tempo))
        .filter((track) => filterKey(track.key, keys))
        .filter((track) => filterMode(track.mode, mode));

      // SORTS and SCORING
      const withHappiness = addAudioFeature(
        filteredTracks,
        happiness,
        "valence",
        "happinessScore"
      );

      const withEnergy = addAudioFeature(
        withHappiness,
        energy,
        "energy",
        "energyScore"
      );

      const withDanceability = addAudioFeature(
        withEnergy,
        danceability,
        "danceability",
        "dancabilityScore"
      );

      const withAcousticness = addAudioFeature(
        withDanceability,
        acousticness,
        "acousticness",
        "acousticnessScore"
      );

      const withInstrumentalness = addAudioFeature(
        withAcousticness,
        instrumentalness,
        "instrumentalness",
        "instrumentalnessScore"
      );

      const sortedTracks = withInstrumentalness.sort(scoreSort);

      res.status(200).json({
        length: sortedTracks.length,
        tracks: sortedTracks,
      });
    } catch (error) {
      console.log(error);
    }
  }
}

module.exports = SearchController;
