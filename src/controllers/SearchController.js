const Track = require("../models/Track");
const Album = require("../models/Album");

function hasKey(key, keys) {
  return keys.includes(key);
}

function sortByParam(trackArr, trackValue, param) {
  return trackArr.sort(
    (a, b) => Math.abs(a[trackValue] - param) - Math.abs(b[trackValue] - param)
  );
}

function addScore(trackArr, scoreKey) {
  return trackArr.map((track, index) => ({
    ...track,
    [scoreKey]: index + 1,
  }));
}

async function addAlbum(track) {
  const album = await Album.find({ id: track.albumId });
  track = await {
    ...track,
    album,
  };
}

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
      const tempoFilteredTracks = tracks.filter(
        (track) => track.tempo > tempo[0] && track.tempo < tempo[1]
      );
      const keyFilteredTracks = tempoFilteredTracks.filter((track) =>
        hasKey(track.key, keys)
      );

      const modeFilteredTracks = keyFilteredTracks.filter((track) => {
        if (mode.length === 2) {
          return true;
        }

        return mode[0] === track.mode;
      });

      // SORTS and SCORING
      const happinessSort = sortByParam(
        modeFilteredTracks,
        "valence",
        happiness
      );
      const addHappinessScore = addScore(happinessSort, "happinessScore");

      const energySort = sortByParam(addHappinessScore, "energy", energy);
      const addEnergyScore = addScore(energySort, "energyScore");

      const danceabilitySort = sortByParam(
        addEnergyScore,
        "danceability",
        danceability
      );
      const addDanceabilityScore = addScore(
        danceabilitySort,
        "dancabilityScore"
      );

      const acousticnessSort = sortByParam(
        addDanceabilityScore,
        "acousticness",
        acousticness
      );
      const addAcousticnessScore = addScore(
        acousticnessSort,
        "acousticnessScore"
      );

      const instrumentalnessSort = sortByParam(
        addAcousticnessScore,
        "instrumentalness",
        instrumentalness
      );
      const addInstrumentalnessScore = addScore(
        instrumentalnessSort,
        "instrumentalnessScore"
      );

      const sortedTracks = addInstrumentalnessScore.sort(
        (a, b) =>
          a.happinessScore +
          a.energyScore +
          a.dancabilityScore +
          a.acousticnessScore +
          a.instrumentalnessScore -
          (b.happinessScore +
            b.energyScore +
            b.dancabilityScore +
            b.acousticnessScore +
            a.instrumentalnessScore)
      );

      // sortedTracks.forEach(addAlbum);

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
